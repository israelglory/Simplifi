import 'package:simplifi/components/page_title_card.dart';
import 'package:simplifi/components/transfer_receipt_component.dart';
import 'package:simplifi/features/simplifi/tabs/simplifi_trensfer_money/simplifi_receipt/simplifi_transfer_receipt_controller.dart';
import 'package:simplifi/routes/exports.dart';

class SimplifiTransferReceiptView extends StatelessWidget {
  const SimplifiTransferReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SimplifiTransferReceiptController>(
      init: SimplifiTransferReceiptController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const PageTitleCard(
                    title: 'Transaction receipt',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SvgPicture.asset(
                    AppAssets.appLogoSvg,
                    height: 80,
                    width: 64,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TransferReceipt(
                    receipt: controller.transaction,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TransferReceiptOptionButtons(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class TransferReceiptOptionButtons extends StatelessWidget {
  const TransferReceiptOptionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: AppButton(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            radius: 8,
            onPressed: () {
              //Get.offAndToNamed(RoutesClass.getRegisterRoute());
            },
            color: AppColors.primaryColor,
            child: const AppText(
              'Share',
              color: Colors.white,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: AppButton(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            radius: 8,
            onPressed: () {
              Get.offAndToNamed(RoutesClass.getBottomNavHomeRoute());
            },
            color: AppColors.appRed,
            child: const AppText(
              'Done',
              color: Colors.white,
              size: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
