import 'package:get/get.dart';
import 'package:radio_life/app/data/enum/status.dart';
import 'package:radio_life/app/data/model/app_exception.dart';
import 'package:radio_life/app/data/model/resource.dart';
import 'package:radio_life/app/data/repositories/my_device/my_device_repository.dart';
import 'package:radio_life/app/domain/entities/device/device_entity.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/model/device_filter_model.dart';
import 'package:radio_life/app/widget/dialog/device_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';

class MyDevicesController extends BaseController {
  final _myDeviceRepository = MyDeviceRepository();
  final deviceFilter = DeviceFilter.empty().obs;

  final state = Resource.loading<List<MyDeviceEntity?>>().obs;
  final mydevices = Resource.loading<List<MyDeviceEntity?>>().obs;

  @override
  void onReady() {
    super.onReady();
    getMyDevices();
  }

  Future getMyDevices() async {
    AppUIBlock.blockUI(context: Get.context);
    final response = await _myDeviceRepository.getMyDevices();
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          state.value = Resource.success(data: data.items);
          mydevices.value = Resource.success(data: data.items);
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  Future<void> applyFilter() async {
    final List<MyDeviceEntity?>? result = [...?mydevices.value.data];

    if (deviceFilter.value.device != null) {
      result?.removeWhere((element) => element?.id != deviceFilter.value.device?.id);
    }

    if (deviceFilter.value.locale != null) {
      result?.removeWhere((element) => element?.locate != deviceFilter.value.locale);
    }

    if (deviceFilter.value.status != null) {
      result?.removeWhere((element) => element?.status != deviceFilter.value.status);
    }

    state.value = Resource.success(data: result);
  }

  void openFilterDialog() {
    deviceFilter(DeviceFilter.empty());
    final filterData = DeviceFilterData(devices: mydevices.value.data, deviceFilter: deviceFilter.value);
    Get.appDialog(
      pageChild: DeviceFilterDialogWidget(
        filterData: filterData,
        onApplyFilter: () => applyFilter(),
        onCancel: () {},
      ),
    );
  }
}
