import 'package:ezanimation/ezanimation.dart';

import 'package:simplifi/routes/exports.dart';

class SplashScreenController extends GetxController {
  final user = FirebaseAuth.instance.currentUser;
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

    if (user != null) {
      Get.offAndToNamed(RoutesClass.getReAuthRoute());
    } else {
      Get.offAndToNamed(RoutesClass.getIntroScreenRoute());
    }

    await Future.delayed(
      const Duration(seconds: 1),
    );

    ezAnimation.reverse();
    update();

    ezAnimation.stop();
    update();
  }
}
