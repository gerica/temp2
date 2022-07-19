import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/adapter/my_devices_adapter.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/device/device_entity.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_my_devices_use_case.dart';

class ReportsController extends BaseController {
  ReportsController(this._getExamsUseCase, this._getMyDevicesUseCase);

  final GetExamsUseCase _getExamsUseCase;
  final GetMyDevicesUseCase _getMyDevicesUseCase;
  final state = Resource.loading<List<ExamEntity>>().obs;
  final myDevices = Resource.loading<List<MyDeviceEntity?>>().obs;
  final reportFilter = ReportFilter(page: 1, perPage: _perPage).obs;

  // infinite scroll
  static const _perPage = 20;
  static const _initPage = 1;
  final PagingController<int, ExamEntity> pagingController = PagingController(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    getExams(_initPage);
    pagingController.addPageRequestListener((pageKey) {
      getExams(pageKey);
    });
    getMyDevices();
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  Future getExams(int pageKey) async {
    AppUIBlock.blockUI(context: Get.context);
    await 1.delay();
    reportFilter.value.page = pageKey;
    final response = await _getExamsUseCase(reportFilter.value);
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;

        if (data != null) {
          final newItems = data.items;
          final isLastPage = data.items.length < _perPage;

          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length as int;
            pagingController.appendPage(newItems, nextPageKey);
          }
        }
        break;
      case Status.failed:
        pagingController.error = 'error';
        break;
    }
  }

  Future getMyDevices() async {
    final response = await _getMyDevicesUseCase();
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          myDevices.value = Resource.success(data: data.items);
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void openFilterDialog() {
    reportFilter(ReportFilter(page: 1, perPage: _perPage));
    final filterData = ReportFilterData(devices: myDevices.value.data, reportFilter: reportFilter.value);
    Get.appDialog(
      pageChild: ReportsFilterDialogWidget(
        filterData: filterData,
        onApplyFilter: () => _applyFilter(),
        onCancel: () {},
      ),
    );
  }

  Future<void> _applyFilter() async {
    state(Resource.loading<List<ExamEntity>>());
    pagingController.refresh();
    await getExams(_initPage);
  }
}
