import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/base_controller.dart';
import 'package:radio_life/app/pages/my_devices/pages/credits_transaction_success/credit_transaction_success_page.dart';
import 'package:radio_life/app/pages/my_devices/pages/my_device_detail/my_device_detail_controller.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/app/widget/loading/app_ui_block.dart';
import 'package:radio_life/core/data/enum/status.dart';
import 'package:radio_life/core/data/model/app_exception.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';
import 'package:radio_life/core/domain/repositories/plans/sign_device_plan_use_case.dart';
import 'package:radio_life/core/domain/use_cases/plans/get_plans_use_case.dart';

class BuyCreditsController extends BaseController {
  BuyCreditsController(
    this._getPlansUseCase,
    this._signDevicePlanUseCase,
  );

  //final Use Cases
  final GetPlansUseCase _getPlansUseCase;
  final SignDevicePlanUseCase _signDevicePlanUseCase;

  //endregion

  //region State
  final state = Resource.loading<List<PlanEntity>>().obs;

//endregion

  //region Variables
  PlanEntity? _selectedPlan;
  late String deviceId;
  final myDeviceDetailController = Get.find<MyDeviceDetailController>();

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
          data: response.data?.items,
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
    final response =
        await _signDevicePlanUseCase(SignDevicePlanParams(deviceId: deviceId, planId: _selectedPlan?.id ?? ''));
    AppUIBlock.unblock(context: Get.context);

    switch (response.status) {
      case Status.loading:
        break;
      case Status.success:
        final int? balance = response.data;
        if (balance != null) {
          myDeviceDetailController.state.value = Resource.success(data: myDeviceDetailController.state.value.data);
        }
        await CreditTransactionSuccessPage.navigateWith(arguments: _selectedPlan!);
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
      state.value = Resource.success(data: data);
    }
  }

  Color backgroudColor(PlanEntity plan) {
    return plan.id == _selectedPlan?.id ? AppColorScheme.primarySwatch : AppColorScheme.white;
  }

  Color textColor(PlanEntity plan) {
    return plan.id == _selectedPlan?.id ? AppColorScheme.white : Colors.black;
  }

//endregion

//region Functions
//endregion

}
