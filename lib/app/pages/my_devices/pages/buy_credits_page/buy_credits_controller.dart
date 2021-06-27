import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/model/plan_model.dart';
import 'package:radio_life/app/styles/app_color_scheme.dart';
import 'package:radio_life/core/data/model/resource.dart';

class BuyCreditsController extends GetxController {
  //region State
  final state = Resource.success<List<PlanModel>>(data: [
    PlanModel(
        name: 'Basic',
        price: 'US\$ 9.90',
        amountOfCredits: '100 credits',
        textColor: Colors.black,
        backgroundColor: AppColorScheme.white),
    PlanModel(
        name: 'Regular',
        price: 'US\$ 59.90',
        amountOfCredits: '1000 credits',
        textColor: AppColorScheme.white,
        backgroundColor: AppColorScheme.primarySwatch),
    PlanModel(
        name: 'Pro',
        price: 'US\$339.90',
        amountOfCredits: '10000 credits',
        textColor: Colors.black,
        backgroundColor: AppColorScheme.white),
  ]).obs;
//endregion

//region Public
//endregion

//region Functions
//endregion

}
