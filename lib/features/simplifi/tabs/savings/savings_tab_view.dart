import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplifi/features/simplifi/tabs/savings/savings_tab_controller.dart';

class SavingsTabView extends StatelessWidget {
  const SavingsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SavingsTabController>(
      init: SavingsTabController(),
      initState: (state) {},
      builder: (controller) {
        return const SafeArea(
          top: true,
          child: Scaffold(
            body: Center(
              child: Text(
                'Savings',
              ),
            ),
          ),
        );
      },
    );
  }
}
