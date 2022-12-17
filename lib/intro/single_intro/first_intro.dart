import 'package:simplifi/intro/intropage_controller.dart';
import 'package:simplifi/routes/exports.dart';

class FirstIntro extends StatelessWidget {
  const FirstIntro({
    Key? key,
  }) : super(key: key);

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
                Image.asset(
                  AppAssets.intro1,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      'Easy Banking',
                      color: AppColors.primaryColor,
                      size: 32,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                      child: AppText(
                        'Bank with ease. Say goodbye to complex banking',
                        color: AppColors.primaryColor,
                        alignment: TextAlign.center,
                        size: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
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
                          color: AppColors.textFieldBackgroundColor,
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
                          color: AppColors.textFieldBackgroundColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  ),
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
                      controller.pageNavigator(1);
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
