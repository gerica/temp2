import 'package:get/get.dart';
import 'package:radio_life/app/pages/reports/pages/report_details/report_details_controller.dart';

class ReportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportDetailsController());
  }
}
