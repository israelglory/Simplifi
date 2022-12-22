import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class AirtimeReceipt extends StatelessWidget {
  final TransferTransactionModel receipt;
  const AirtimeReceipt({Key? key, required this.receipt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          receiptRow(title: 'Transaction date:', value: '01 Nov, 2022'),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Transaction type:',
            value: 'Airtime Recharge',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Network provider:',
            value: receipt.bankName!,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Number:',
            value: receipt.accountNumber!,
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Amount:',
            value: '₦${receipt.amount}',
          ),
          /*const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Reference number',
            value: 'REFAir20221101235600',
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
