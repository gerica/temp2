import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/my_devices/adapter/my_devices_adapter.dart';
import 'package:radio_life/app/pages/my_devices/model/my_device_model.dart';
import 'package:radio_life/app/pages/my_devices/model/report_filter_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/reports_filter_dialog_widget.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/exam/exam_entity.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';
import 'package:radio_life/core/domain/use_cases/my_devices/get_my_devices_use_case.dart';

class ReportsController extends GetxController {
  ReportsController(this._getExamsUseCase, this._getMyDevicesUseCase);

  final GetExamsUseCase _getExamsUseCase;
  final GetMyDevicesUseCase _getMyDevicesUseCase;
  final state = Resource.loading<List<ExamEntity>>().obs;
  final myExams = Resource.loading<List<ExamEntity>>().obs;
  final myDevices = Resource.loading<List<MyDeviceModel?>>().obs;
  final reportFilter = ReportFilter.empty().obs;

  // infinite scroll
  static const _perPage = 20;
  final PagingController<int, ExamEntity> pagingController = PagingController(firstPageKey: 0);

  @override
  void onReady() {
    super.onReady();
    getExams(0);
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
    final response = await _getExamsUseCase(FilterParams(page: pageKey, perPage: _perPage));
    AppUIBlock.unblock(context: Get.context);
    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final data = response.data;

        if (data != null) {
          // DateFormat('MM/dd/yyyy').format(exams.date as DateTime),
          final newItems = data.items;
          final isLastPage = data.items.length < _perPage;

          if (isLastPage) {
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + newItems.length;
            pagingController.appendPage(newItems, nextPageKey);
          }
          // state.value = Resource.success(data: newItems);
          myExams.value = Resource.success(data: newItems);
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
    final List<ExamEntity> result = [...?myExams.value.data];
    final ReportFilter report = reportFilter.value;

    if (report.device != null) {
      result.removeWhere((element) => element.deviceId != report.device?.id);
    }

    if (report.resultTest != null) {
      result.removeWhere((element) => element.result != report.resultTest?.value);
    }

    if (report.startDate != null && report.endDate != null) {
      result.removeWhere((element) {
        // final DateTime dateExam = DateFormat('MM/DD/yyyy').parse(element.date);
        final DateTime dateExam = element.date as DateTime;
        if (dateExam.compareTo(report.startDate as DateTime) >= 0 &&
            dateExam.compareTo(report.endDate as DateTime) <= 0) {
          return false;
        }
        return true;
      });
    }
    state.value = Resource.success(data: result);
  }
}
