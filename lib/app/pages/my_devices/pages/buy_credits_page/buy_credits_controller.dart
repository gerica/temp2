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
import 'package:radio_life/core/data/repositories/plans/plans_repository.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';

class BuyCreditsController extends BaseController {
  final _plansRepository = PlansRepository();
  final state = Resource.loading<List<PlanEntity>>().obs;

  PlanEntity? _selectedPlan;
  late String deviceId;
  final myDeviceDetailController = Get.find<MyDeviceDetailController>();

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
    final response = await _plansRepository.getPlans();
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
    final response = await _plansRepository.signDevicePlan(deviceId: deviceId, planId: _selectedPlan?.id ?? '');
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
