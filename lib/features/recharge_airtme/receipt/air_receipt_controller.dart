import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class AirReceiptController extends GetxController {
  final transaction = Get.arguments as TransferTransactionModel;
}
