import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplifi/features/simplifi/tabs/payments/payment_tab_controller.dart';

class PaymentTabView extends StatelessWidget {
  const PaymentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentTabController>(
      init: PaymentTabController(),
      initState: (state) {},
      builder: (controller) {
        return const SafeArea(
          top: true,
          child: Scaffold(
            body: Center(child: Text('Payemnt')),
          ),
        );
      },
    );
  }
}
