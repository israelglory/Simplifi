import 'package:ezanimation/ezanimation.dart';

import 'package:simplifi/routes/exports.dart';

class SplashScreenController extends GetxController {
  EzAnimation ezAnimation =
      EzAnimation(200.0, 300.0, const Duration(seconds: 1));

  @override
  void onInit() async {
    super.onInit();
    ezAnimation.start();
    update();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    ezAnimation.reverse();
    update();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    ezAnimation.reverse();
    update();
    Get.offAndToNamed(RoutesClass.getIntroScreenRoute());
    ezAnimation.stop();
    update();
  }
}
