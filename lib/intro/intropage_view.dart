import 'package:simplifi/intro/intropage_controller.dart';
import 'package:simplifi/intro/single_intro/first_intro.dart';
import 'package:simplifi/intro/single_intro/second_intro.dart';
import 'package:simplifi/intro/single_intro/third_intro.dart';
import 'package:simplifi/routes/exports.dart';

class IntroPageView extends StatelessWidget {
  const IntroPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntroPageController>(
      init: IntroPageController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    children: const [
                      FirstIntro(),
                      SecondIntro(),
                      ThirdIntro(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.index == 0
                            ? AppColors.primaryColor
                            : AppColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.index == 1
                            ? AppColors.primaryColor
                            : AppColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: controller.index == 2
                            ? AppColors.primaryColor
                            : AppColors.textFieldBackgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                //const Spacer(),
                Visibility(
                  visible: controller.index < 2,
                  replacement: Column(
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
                            Get.offAndToNamed(RoutesClass.getRegisterRoute());
                          },
                          color: AppColors.primaryColor,
                          child: const AppText(
                            'Get Started',
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
                            Get.offAndToNamed(RoutesClass.getLoginRoute());
                          },
                          color: AppColors.appRed,
                          child: const AppText(
                            'Login',
                            color: Colors.white,
                            size: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: AppButton(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      radius: 8,
                      onPressed: () {
                        controller.pageNavigator();
                      },
                      color: AppColors.primaryColor,
                      child: const AppText(
                        'Next',
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
              ],
            ),
          ),
        );
      },
    );
  }
}
