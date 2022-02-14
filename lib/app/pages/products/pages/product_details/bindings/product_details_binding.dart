import 'package:get/get.dart';
import 'package:radio_life/app/pages/products/pages/product_details/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductDetailsController());
  }
}
