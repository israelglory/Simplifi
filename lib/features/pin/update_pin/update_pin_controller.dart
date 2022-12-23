import 'package:simplifi/routes/exports.dart';

class UpdatePinController extends GetxController {
  TextEditingController pinController = TextEditingController();

  Future<void> onCompleted(String pin) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'pin': pin,
      });
      pinController.clear();
      Get.offAndToNamed(RoutesClass.getBottomNavHomeRoute());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        'Unable to update pin, Try again',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
      pinController.clear();
      update();
    }
  }

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
}
