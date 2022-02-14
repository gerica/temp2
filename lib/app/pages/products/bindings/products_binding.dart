import 'package:get/get.dart';
import 'package:radio_life/app/pages/products/products_controller.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController());
  }
}
