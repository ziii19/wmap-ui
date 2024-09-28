import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Stack(
        children: <Widget>[
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0)
                      .copyWith(top: 8.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 48,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(300),
                            color: AppColor.white3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Payment with QR Code',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Hold the code inside the frame, it will be scanned automatically',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 50),
                      Center(
                          child: (result != null)
                              ? Text(
                                  'Barcode Type: ${result!.format.name}   Data: ${result!.code}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )
                              : Text(
                                  'Scan a code',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: 170,
              left: 37.5,
              right: 37.5,
              child: SvgPicture.asset(AssetsSvg.scanner)),
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
                textPadding: const EdgeInsets.only(left: 30),
                titleColor: AppColor.white,
                actions: [
                  GestureDetector(
                    onTap: () async => await controller?.toggleFlash(),
                    child: SvgPicture.asset(
                      AssetsSvg.flash,
                      colorFilter: const ColorFilter.mode(
                        AppColor.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    child: const IconWrap(
                      icon: AssetsSvg.help,
                      color: AppColor.white,
                    ),
                  ),
                ]),
          ),
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
