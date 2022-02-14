import 'package:get/get.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/core/data/model/resource.dart';

import 'package:radio_life/generated/l10n.dart';
import 'adapter/home_adapter.dart';
import 'model/home_model.dart';

class HomeController extends GetxController {
  //region Private
  //endregion

  //region State
  Rx<Resource<HomeModel>> state =
      Resource.success<HomeModel>(data: HomeAdapter.toModel).obs;

  //endregion

  //region Variables
  final items = [
    S.current.myDevices,
    S.current.reports,
    S.current.support,
    S.current.profile
  ];
  final icons = [
    AppSvgImages.icMyDevices,
    AppSvgImages.icReports,
    AppSvgImages.icSupport,
    AppSvgImages.icProfile
  ];

  //endregion

  //region Functions
  void navigateTo(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.myDevices);
        break;
      case 1:
        Get.toNamed(Routes.reports);
        break;
      case 2:
        Get.toNamed(Routes.support);
        break;
      case 3:
        Get.toNamed(Routes.profile);
        break;
    }
  }
//endregion

}
