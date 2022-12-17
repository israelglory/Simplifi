import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplifi/features/simplifi/tabs/budget/budget_tab_controller.dart';

class BudgetTabView extends StatelessWidget {
  const BudgetTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BudgetTabController>(
      init: BudgetTabController(),
      initState: (state) {},
      builder: (controller) {
        return const SafeArea(
          top: true,
          child: Scaffold(
            body: Center(
              child: Text(
                'Budget',
              ),
            ),
          ),
        );
      },
    );
  }
}
