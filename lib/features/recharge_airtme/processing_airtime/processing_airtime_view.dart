import 'package:simplifi/features/recharge_airtme/processing_airtime/processing_airtime_controller.dart';
import 'package:simplifi/routes/exports.dart';

class ProcessAirtimeView extends StatelessWidget {
  const ProcessAirtimeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProcessAirtimeController>(
      init: ProcessAirtimeController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
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
                const Spacer(),
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
                            controller.onAddBeneficiary();
                          },
                          color: AppColors.primaryColor,
                          child: Visibility(
                            visible: !controller.inProgress,
                            replacement: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            child: const AppText(
                              'Add to Beneficiary',
                              color: Colors.white,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
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
                                RoutesClass.getAirtimeReceiptRoute(),
                                arguments: controller.transaction);
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
