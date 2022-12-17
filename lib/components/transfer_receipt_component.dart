import 'package:simplifi/routes/exports.dart';

class TransferReceipt extends StatelessWidget {
  const TransferReceipt({Key? key}) : super(key: key);

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
            value: 'Money Transfer',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Sender:',
            value: 'Fidelis Omoroighe',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Amount',
            value: '₦10,000',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Receiver:',
            value: 'Bolarinwa Akorede',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Bank name:',
            value: 'Kuda MFB',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Account number:',
            value: '0123456789',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Description:',
            value: 'For goods',
          ),
          const SizedBox(
            height: 16,
          ),
          receiptRow(
            title: 'Reference number',
            value: 'REF20221101235600',
          ),
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
