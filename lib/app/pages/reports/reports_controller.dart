import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/reports/adapter/reports_adapter.dart';
import 'package:radio_life/app/pages/reports/model/report_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/use_cases/exams/get_exams_use_case.dart';

class ReportsController extends GetxController {
  ReportsController(this._getExamsUseCase);

  //region Use Cases
  final GetExamsUseCase _getExamsUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<ReportModel>>().obs;

  @override
  void onReady() {
    super.onReady();
    getExams();
  } //endregion

  //region Variables
//endregion

//region Functions



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
          state.value =
              Resource.success(data: ReportsAdapter.fromEntityList(data));
        }
        break;
      case Status.failed:
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
//endregion

}
