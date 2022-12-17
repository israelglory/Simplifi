import 'package:simplifi/routes/exports.dart';

class InputTranserPinController extends GetxController {
  TextEditingController pinController = TextEditingController();
  void onButtonClick(String number) {
    print('clicked');
    pinController.text += number;
    pinController.selection = TextSelection.fromPosition(
        TextPosition(offset: pinController.text.length));
    update();
  }

  void onBackspace() {
    if (pinController.text.isNotEmpty) {
      pinController.text =
          pinController.text.substring(0, pinController.text.length - 1);
    }
  }
}
