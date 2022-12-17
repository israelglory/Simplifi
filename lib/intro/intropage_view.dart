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
        return PageView(
          controller: controller.pageController,
          children: const [
            FirstIntro(),
            SecondIntro(),
            ThirdIntro(),
          ],
        );
      },
    );
  }
}
