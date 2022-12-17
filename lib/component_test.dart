import 'package:simplifi/component_test_controller.dart';
import 'package:simplifi/components/beneficiary_item.dart';
import 'package:simplifi/components/transaction_card.dart';
import 'package:simplifi/routes/exports.dart';

class ComponentTest extends StatelessWidget {
  const ComponentTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ComponentTestController>(
      init: ComponentTestController(),
      initState: (state) {},
      builder: (controller) {
        return SafeArea(
          top: true,
          child: Scaffold(
            //backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                ),
                TransactionCard(),
                AppHeightSizedBox(height: 16),
                BeneficiaryItem(),
              ],
            ),
          ),
        );
      },
    );
  }
}
