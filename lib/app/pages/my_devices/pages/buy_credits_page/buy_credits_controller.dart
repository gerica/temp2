import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/helper/dialog_helper.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/adapter/plans_adapter.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/model/plan_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/dialog/simple_dialog.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/repositories/plans/sign_device_plan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/plans/get_plans_use_case.dart';

import '../../../../radio_life_app_routes.dart';

class BuyCreditsController extends GetxController {
  BuyCreditsController(
    this._getPlansUseCase,
    this._signDevicePlanUseCase,
  );

  //final Use Cases
  final GetPlansUseCase _getPlansUseCase;
  final SignDevicePlanUseCase _signDevicePlanUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<PlanModel>>().obs;

//endregion

  //region Variables
  PlanModel? _selectedPlan;
  late String deviceId;

  //endregion

//region Public

  @override
  void onInit() {
    super.onInit();
    deviceId = tryCast<String>(Get.arguments) ?? '';
  }

  @override
  void onReady() {
    super.onReady();
    getPlans();
  }

  Future getPlans() async {
    AppUIBlock.blockUI(context: Get.context);
    final response = await _getPlansUseCase();
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        state.value = Resource.success(
          data: PlansAdapter.toModel(response.data ?? []),
        );
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  Future signDevicePlan() async {
    if (_selectedPlan == null) return;
    AppUIBlock.blockUI(context: Get.context);
    final response = await _signDevicePlanUseCase(SignDevicePlanParams(
        deviceId: deviceId, planId: _selectedPlan?.id ?? ''));
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        Get.offNamed(Routes.creditsTransactionSuccess);
        break;
      case Status.failed:
        handleError(response.error ?? AppException.generic());
        break;
    }
  }

  void selectPlan(int index) {
    final data = state.value.data;
    if (data != null) {
      _selectedPlan = data[index];
      state.value = Resource.success(
          data: data
              .map(
                (plan) => plan.copyWith(
                  isSelected: plan.id == _selectedPlan?.id,
                  backgroundColor: plan.id == _selectedPlan?.id
                      ? AppColorScheme.primarySwatch
                      : AppColorScheme.white,
                  textColor: plan.id == _selectedPlan?.id
                      ? AppColorScheme.white
                      : Colors.black,
                ),
              )
              .toList());
    }
  }

  void handleError(AppException error) {
    if (error.description == 'Please Login Again!') {
      Get.offAllNamed(Routes.signIn);
    }
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

//region Functions
//endregion

}
