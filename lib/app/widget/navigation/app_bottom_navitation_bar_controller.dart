import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';

class AppBottomNavigationController extends GetxController {
  //region Private
  //endregion

  //region Variables

  final bottomBarCurrentIndex = 0.obs;

  void changePage(int index) {
    if(index == bottomBarCurrentIndex.value) return;
    bottomBarCurrentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.products, predicate: ModalRoute.withName('/'));
        break;
      case 1:
        Get.offAllNamed(Routes.myDevices, predicate: ModalRoute.withName('/'));
        break;
      case 2:
        Get.offAllNamed(Routes.reports, predicate: ModalRoute.withName('/'));
        break;
      case 3:
        Get.offAllNamed(Routes.support, predicate: ModalRoute.withName('/'));
        break;
      case 4:
        Get.offAllNamed(Routes.profile, predicate: ModalRoute.withName('/'));
        break;
    }
  }

//endregion

//region Functions
//endregion

}
