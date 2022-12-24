import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class TransferReceiptController extends GetxController {
  final transaction = Get.arguments as TransferTransactionModel;
  GlobalKey globalKey = GlobalKey();

  /*Future<void> capturePng() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    print(pngBytes);
  }*/
}
