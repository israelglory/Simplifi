import 'package:simplifi/components/custom_avatar.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class TransactionCard extends StatelessWidget {
  final TransferTransactionModel transaction;
  final bool isDebit;
  const TransactionCard(
      {Key? key, required this.transaction, required this.isDebit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          const CustomAvatar(
            url: 'https://static.thenounproject.com/png/407799-200.png',
            height: 42,
            width: 42,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  transaction.receiver!,
                  fontWeight: FontWeight.w600,
                  size: 14,
                ),
                const AppHeightSizedBox(
                  height: 2,
                ),
                AppText(
                  transaction.transactionDate!,
                  fontWeight: FontWeight.w400,
                  size: 12,
                )
              ],
            ),
          ),
          AppText(
            '${isDebit ? '-' : '+'}₦${transaction.amount}',
            fontWeight: FontWeight.w600,
            color: isDebit ? Colors.red : Colors.green,
            size: 14,
          )
        ],
      ),
    );
  }
}
