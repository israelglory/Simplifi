import 'package:simplifi/routes/exports.dart';

class IntroPageController extends GetxController {
  late PageController pageController;
  int index = 0;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    update();
  }

  void pageNavigator() {
    if (pageController.hasClients && index < 2) {
      index = index + 1;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
      update();
    }
  }

  Future<void> navigateToView(BuildContext context, Widget view) async {
    await Navigator.push(context, MaterialPageRoute(builder: (_) => view));
    update();
  }
}
