import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:wpay/utils/constants/assets_svg.dart';
import 'package:wpay/utils/theme/app_color.dart';
import 'package:wpay/widgets/custom_app_bar.dart';
import 'package:wpay/widgets/icon_wrap.dart';

class QrScanPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const QrScanPage(),
      );
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomAppBar(
              leading: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const IconWrap(
                    icon: AssetsSvg.arrowBack,
                    color: AppColor.white,
                  )),
              title: 'Scan to Pay',
              titleColor: AppColor.white,
              actions: const IconWrap(
                icon: AssetsSvg.help,
                color: AppColor.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: (result != null)
                    ? Text(
                        'Barcode Type: ${result!.format.name}   Data: ${result!.code}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColor.white),
                      )
                    : Text(
                        'Scan a code',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColor.white),
                      )),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
