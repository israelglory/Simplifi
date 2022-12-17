import 'package:simplifi/components/dialogs/transfer_money_confirm.dart';
import 'package:simplifi/routes/exports.dart';

class TransferMoneyController extends GetxController {
  TextEditingController accountNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();

  void onTransferMoney() {
    Get.defaultDialog(
      title: '',
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      content: TransferConfirmationDialog(
        onPressed: () {
          Get.toNamed(RoutesClass.getInputTransferPinRoute());
        },
      ),
    );
  }
}
