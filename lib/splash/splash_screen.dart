import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/splash/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(
                  height: 30,
                ),
                const AppText(
                  'Banking made easy',
                  size: 25,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
