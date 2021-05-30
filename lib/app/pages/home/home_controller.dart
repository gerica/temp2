import 'package:get/get.dart';
import 'package:radio_life/app/images/app_svg_images.dart';
import 'package:radio_life/app/radio_life_app_routes.dart';
import 'package:radio_life/core/data/model/resource.dart';

import '../../../generated/l10n.dart';
import 'adapter/home_adapter.dart';
import 'model/home_model.dart';

class HomeController extends GetxController {

  //region Private
  //endregion

  //region State
  Rx<Resource<HomeModel>> state = Resource.success<HomeModel>(
    data: HomeAdapter.toModel
  ).obs;
  //endregion

  //region Variables
  final items = [
    S.current.products,
    S.current.reports,
    S.current.myDevices,
    S.current.support
  ];
  final icons = [
    AppSvgImages.icProducts,
    AppSvgImages.icReports,
    AppSvgImages.icMyDevices,
    AppSvgImages.icSupport
  ];
  //endregion

  //region Functions
  void navigateTo(int index){
    switch(index){
      case 0:
        Get.toNamed(Routes.products);
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
    }
  }
  //endregion

}