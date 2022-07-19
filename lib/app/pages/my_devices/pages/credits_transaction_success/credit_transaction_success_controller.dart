import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/my_devices_controller.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/app/utils/try_cast.dart';
import 'package:radio_life/core/data/model/resource.dart';
import 'package:radio_life/core/domain/entities/plans/plan_entity.dart';

class CreditTransactionSuccessController extends GetxController {
  //region State
  final state = Resource.loading<PlanEntity>().obs;

  //endregion

  //region Public
  //endregion

  //region Functions
  @override
  Future onReady() async {
    super.onReady();
    final param = tryCast<PlanEntity>(Get.arguments);
    await 1.delay();
    if (param != null) state.value = Resource.success(data: param);
  }

  Future<void> goToMyDevicePage() async {
    await Get.delete<MyDevicesController>();
    Get.offAllNamed(
      Routes.myDevices,
      predicate: ModalRoute.withName('/'),
    );
  }
//endregion

}
