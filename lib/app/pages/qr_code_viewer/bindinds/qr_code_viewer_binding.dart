import 'package:get/get.dart';
import 'package:radio_life/app/pages/qr_code_viewer/qr_code_viewer_controller.dart';

class QRCodeViewerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QRCodeViewerController());
  }
}
