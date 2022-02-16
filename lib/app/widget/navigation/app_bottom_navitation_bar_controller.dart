import 'package:get/get.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';

class AppBottomNavigationController extends GetxController {
  //region Private
  //endregion

  //region Variables

  final bottomBarCurrentIndex = 0.obs;

  void changePage(int index) {
    // Sof-I111
    // if (index == bottomBarCurrentIndex.value) return;
    bottomBarCurrentIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed(Routes.myDevices);
        break;
      case 1:
        Get.offAllNamed(Routes.reports);
        break;
      case 2:
        Get.offAllNamed(Routes.support);
        break;
      case 3:
        Get.offAllNamed(Routes.profile);
        break;
    }
  }

//endregion

//region Functions
//endregion

}
