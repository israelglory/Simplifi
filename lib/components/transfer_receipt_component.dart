import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:jiffy/jiffy.dart';

class TransferReceipt extends StatelessWidget {
  final TransferTransactionModel receipt;
  const TransferReceipt({Key? key, required this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          receiptRow(
            title: 'Transaction date:',
            value: date,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Transaction type:',
            value: 'Money Transfer',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Sender:',
            value: receipt.sender!,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Amount',
            value: receipt.amount.toString(),
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(title: 'Receiver:', value: receipt.receiver!),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Bank name:',
            value: receipt.bankName!,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Account number:',
            value: receipt.accountNumber!,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Description:',
            value: receipt.description!,
          ),
          /*const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Reference number',
            value: receipt.referenceNumber!,
          ),*/
        ],
      ),
    );
  }

  Widget receiptRow({required String title, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppText(
          title,
          size: 16,
          fontWeight: FontWeight.w400,
        ),
        AppText(
          value,
          size: 16,
          fontWeight: FontWeight.w600,
        )
      ],
    );
  }
}
