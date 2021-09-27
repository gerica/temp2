import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/buy_credits_page/buy_credits_controller.dart';
import 'package:radio_life/di/di.dart';

class BuyCreditsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuyCreditsController(
          getIt(),
          getIt(),
        ));
  }
}
