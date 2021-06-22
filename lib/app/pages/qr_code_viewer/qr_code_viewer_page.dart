import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:radio_life/app/widget/app_bar/radiolife_app_bar_widget.dart';

class QRCodeViewerPage extends StatefulWidget {
  const QRCodeViewerPage({Key? key}) : super(key: key);

  @override
  _QRCodeViewerPageState createState() => _QRCodeViewerPageState();
}

class _QRCodeViewerPageState extends State<QRCodeViewerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      _controller?.pauseCamera();
    } else if (Platform.isIOS) {
      _controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: RadioLifeAppBarWidget(
          showBackButton: true,
          backButtonColor: Colors.white,
          brightness: Brightness.dark,
          titleText: '',
          backgroundColor: Colors.transparent,
          onBackButtonPressed: () {
            Get.back();
          },
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: QRView(
                key: qrKey,
                overlay: QrScannerOverlayShape(),
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
          ],
        ),
      );

  void _onQRViewCreated(QRViewController controller) {
    _controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      String? result;
      if (result == null) {
        result = 'Barcode Type: ${describeEnum(scanData.format)}\nData: ${scanData.code}';
        controller.pauseCamera();
        Get.back(result: result);
        await 0.5.delay();
      }
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey<State<StatefulWidget>>>('qrKey', qrKey));
  }
}
