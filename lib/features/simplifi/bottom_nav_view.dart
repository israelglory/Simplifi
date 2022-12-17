import 'package:simplifi/features/simplifi/bottom_nav_controller.dart';
import 'package:simplifi/routes/exports.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      init: BottomNavController(),
      builder: (controller) {
        return Scaffold(
          body: controller.children[controller.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            iconSize: 20.0,
            selectedFontSize: 14.0,
            unselectedFontSize: 14.0,
            enableFeedback: true,
            unselectedItemColor: Colors.grey.shade400,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedIconTheme: IconThemeData(
              color: AppColors.primaryColor,
            ),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.money,
                ),
                label: 'Payment',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bar_chart_rounded,
                ),
                label: 'Budget',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on_rounded,
                ),
                label: 'Savings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.more_vert_rounded,
                ),
                label: 'More',
              ),
            ],
            currentIndex: controller.selectedIndex,
            selectedItemColor: AppColors.primaryColor,
            onTap: controller.onItemTapped,
          ),
        );
      },
    );
  }
}
