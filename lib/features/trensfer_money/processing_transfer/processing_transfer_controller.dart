import 'package:ezanimation/ezanimation.dart';
import 'package:simplifi/routes/exports.dart';

class ProcessTransferController extends GetxController
    with GetTickerProviderStateMixin {
  EzAnimation ezAnimation =
      EzAnimation(200.0, 300.0, const Duration(seconds: 1));
  bool isLoading = true;
  @override
  void onInit() async {
    super.onInit();
    animateIt();
  }

  void animateIt() async {
    isLoading = true;
    update();
    ezAnimation.start();
    update();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    ezAnimation.repeat(rev: true);
    update();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    ezAnimation.stop();
    update();
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    ezAnimation.dispose();
    print('Disposed');
  }
}
