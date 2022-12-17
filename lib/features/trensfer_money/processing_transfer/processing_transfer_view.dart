import 'package:simplifi/features/trensfer_money/processing_transfer/processing_transfer_controller.dart';
import 'package:simplifi/routes/exports.dart';

class ProcessTransferView extends StatelessWidget {
  const ProcessTransferView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProcessTransferController>(
      init: ProcessTransferController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                AnimatedBuilder(
                  animation: controller.ezAnimation,
                  builder: (context, child) {
                    return SvgPicture.asset(
                      AppAssets.appLogoSvg,
                      height: controller.ezAnimation.value,
                      width: controller.ezAnimation.value,
                    );
                  },
                ),
                Spacer(),
                Visibility(
                  visible: !controller.isLoading,
                  child: Column(
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
                            'Add to Beneficiary',
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
                            Get.offAndToNamed(
                                RoutesClass.getTransferReceiptRoute());
                          },
                          color: AppColors.primaryColor,
                          child: const AppText(
                            'Transaction Reciept',
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
                            Get.offAndToNamed(
                                RoutesClass.getBottomNavHomeRoute());
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
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
