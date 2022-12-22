import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class TransferConfirmationDialog extends StatelessWidget {
  final Function() onPressed;
  final TransferTransactionModel receipt;
  const TransferConfirmationDialog({
    Key? key,
    required this.onPressed,
    required this.receipt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          AppText(
            'Confirmation',
            color: AppColors.primaryColor,
            size: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 20,
          ),
          SvgPicture.asset(
            AppAssets.transferConfirm,
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          AppText(
            'Transfer ₦${receipt.amount} to',
            color: AppColors.primaryColor,
            size: 16,
            alignment: TextAlign.center,
            maxLines: 3,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 16,
          ),
          AppText(
            '${receipt.receiver} -  ${receipt.accountNumber} ${receipt.bankName}?',
            alignment: TextAlign.center,
            maxLines: 3,
            color: AppColors.primaryColor,
            size: 20,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppButton(
                radius: 8,
                color: AppColors.appRed,
                padding: const EdgeInsets.all(12.0),
                width: 100,
                onPressed: () {
                  Get.back();
                },
                child: const AppText(
                  'No',
                  color: Colors.white,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              AppButton(
                radius: 8,
                color: AppColors.primaryColor,
                padding: const EdgeInsets.all(12.0),
                width: 100,
                onPressed: onPressed,
                child: const AppText(
                  'Yes',
                  color: Colors.white,
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
