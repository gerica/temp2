import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/my_devices/adapter/my_devices_adapter.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/app/pages/reports/adapter/reports_adapter.dart';
import 'package:radio_life/app/pages/reports/model/report_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_my_devices_use_case.dart';

class ReportsController extends GetxController {
  ReportsController(this._getExamsUseCase, this._getMyDevicesUseCase);

  final GetExamsUseCase _getExamsUseCase;
  final GetMyDevicesUseCase _getMyDevicesUseCase;
  final state = Resource.loading<List<ReportModel>>().obs;
  final myExams = Resource.loading<List<ReportModel>>().obs;
  final myDevices = Resource.loading<List<MyDeviceModel?>>().obs;
  final reportFilter = ReportFilter.empty().obs;

  @override
  void onReady() {
    super.onReady();
    getExams();
    getMyDevices();
  }

  Future getExams() async {
    AppUIBlock.blockUI(context: Get.context);
    await 1.delay();
    final response = await _getExamsUseCase('');
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;
        if (data != null) {
          state.value = Resource.success(data: ReportsAdapter.fromEntityList(data));
          myExams.value = Resource.success(data: ReportsAdapter.fromEntityList(data));
        }
        break;
      case Status.failed:
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
          myDevices.value = Resource.success(data: data.toModelList);
        }
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void handleError(AppException error) {
    Get.appDialog(
      barrierDismissible: false,
      pageChild: AppSimpleDialog(
        title: error.title ?? '',
        message: error.description ?? '',
        icon: Icon(Icons.error_outline, size: 50, color: AppColorScheme.error),
        onClosePressed: () {
          Get.back();
        },
      ),
    );
  }

  void openFilterDialog() {
    reportFilter(ReportFilter.empty());
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
    final List<ReportModel> result = [...?myExams.value.data];

    if (reportFilter.value.device != null) {
      result.removeWhere((element) => element.deviceId != reportFilter.value.device?.id);
    }

    if (reportFilter.value.resultTest != null) {
      result.removeWhere((element) => element.result != reportFilter.value.resultTest.value);
    }

    state.value = Resource.success(data: result);
  }
}
