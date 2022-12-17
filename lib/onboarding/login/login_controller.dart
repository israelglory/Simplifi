import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';

class LoginController extends GetxController {
  final UserAuth userAuth = UserAuth();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool inProgress = false;
  bool show = true;

  ///This is to hide the password
  void onObscure() {
    show = false;
    update();
  }

  ///We use this function to show password
  onhide() {
    show = true;
    update();
  }

  void login() async {
    try {
      if (emailController.text.isEmpty) {
        Get.snackbar(
          "Error",
          'Email Cannot be empty',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      } else if (passController.text.isEmpty) {
        Get.snackbar(
          "Error",
          'Password Cannot be empty',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        inProgress = true;
        update();
        await userAuth.loginWithEmailAndPass(
          email: emailController.text.trim(),
          password: passController.text.trim(),
        );
        Get.offAndToNamed(RoutesClass.getBottomNavHomeRoute());
        inProgress = false;
        update();
      }
    } on FirebaseAuthException catch (e) {
      inProgress = false;
      update();
      Get.snackbar(
        "Error",
        e.message!,
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
