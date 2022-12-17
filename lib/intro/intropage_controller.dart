import 'package:simplifi/routes/exports.dart';

class IntroPageController extends GetxController {
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    update();
  }

  void pageNavigator(int index) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> navigateToView(BuildContext context, Widget view) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => view));
    update();
  }
}
