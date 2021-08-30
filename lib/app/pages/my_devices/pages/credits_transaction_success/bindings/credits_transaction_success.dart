import 'package:get/get.dart';
import 'package:radio_life/app/pages/my_devices/pages/credits_transaction_success/credit_transaction_success_controller.dart';

class CreditTransactionSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreditTransactionSuccessController());
  }
}
