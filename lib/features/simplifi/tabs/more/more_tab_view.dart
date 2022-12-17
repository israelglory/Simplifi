import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplifi/features/simplifi/tabs/more/more_tab_controller.dart';

class MoreTabView extends StatelessWidget {
  const MoreTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MoreTabController>(
      init: MoreTabController(),
      initState: (state) {},
      builder: (controller) {
        return const SafeArea(
          top: true,
          child: Scaffold(
            body: Center(child: Text('More')),
          ),
        );
      },
    );
  }
}
