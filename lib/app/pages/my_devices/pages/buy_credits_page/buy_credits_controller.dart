import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/model/plan_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/core/data/model/resource.dart';

class BuyCreditsController extends GetxController {
  //region State
  final state = Resource.success<List<PlanModel>>(data: [
    PlanModel(
        id: '1',
        name: 'Basic',
        price: 'US\$ 9.90',
        amountOfCredits: '100 credits',
        textColor: Colors.black,
        isSelected: false,
        backgroundColor: AppColorScheme.white),
    PlanModel(
        id: '2',
        name: 'Regular',
        price: 'US\$ 59.90',
        amountOfCredits: '1000 credits',
        textColor: AppColorScheme.white,
        isSelected: true,
        backgroundColor: AppColorScheme.primarySwatch),
    PlanModel(
        id: '3',
        name: 'Pro',
        price: 'US\$339.90',
        amountOfCredits: '10000 credits',
        textColor: Colors.black,
        isSelected: false,
        backgroundColor: AppColorScheme.white),
  ]).obs;

//endregion

  //region Variables
  late PlanModel _selectedPlan;

  //endregion

//region Public
  void selectPlan(int index) {
    final data = state.value.data;
    if (data != null) {
      _selectedPlan = data[index];
      state.value = Resource.success(
          data: data
              .map(
                (plan) => plan.copyWith(
                  isSelected: plan.id == _selectedPlan.id,
                  backgroundColor: plan.id == _selectedPlan.id
                      ? AppColorScheme.primarySwatch
                      : AppColorScheme.white,
                  textColor: plan.id == _selectedPlan.id ? AppColorScheme.white : Colors.black,
                ),
              )
              .toList());
    }
  }
//endregion

//region Functions
//endregion

}
