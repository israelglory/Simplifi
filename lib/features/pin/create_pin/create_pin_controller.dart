import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';

class CreatePinController extends GetxController {
  final UserAuth userAuth = UserAuth();
  TextEditingController pinController = TextEditingController();
  void onButtonClick(String number) {
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

  void createPin(String finalPin) {
    userAuth.createPin(pin: finalPin);
    Get.offAndToNamed(RoutesClass.getBottomNavHomeRoute());
  }
}
