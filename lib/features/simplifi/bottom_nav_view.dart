import 'package:flutter/cupertino.dart';
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
            unselectedItemColor: Colors.grey,
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
                  CupertinoIcons.rocket_fill,
                ),
                label: 'Transfer',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.device_phone_portrait,
                ),
                label: 'Recharge',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.monetization_on_rounded,
                ),
                label: 'Savings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
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
