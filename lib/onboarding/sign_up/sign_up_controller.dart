import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';

class SignUpController extends GetxController {
  final UserAuth userAuth = UserAuth();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool show = true;
  bool inProgress = false;
  bool terms = false;

  ///This is to hide the password
  void onObscure() {
    show = false;
    update();
  }

  void onTermAccept(bool newval) {
    terms = newval;
    update();
  }

  ///We use this function to show password
  onhide() {
    show = true;
    update();
  }

  ///Signingup with fullname and email and password
  void signUp() async {
    try {
      if (emailController.text.isEmpty ||
          firstNameController.text.isEmpty ||
          passController.text.isEmpty ||
          lastNameController.text.isEmpty ||
          userNameController.text.isEmpty) {
        Get.snackbar(
          "Error",
          'One field is empty, Please fill accordingly',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      } else if (terms == false) {
        Get.snackbar(
          "Error",
          'Please agree terms and processed',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      } else if (passController.text != confirmPassController.text) {
        Get.snackbar(
          "Error",
          'Password doesn\'t match',
          dismissDirection: DismissDirection.horizontal,
          colorText: Colors.white,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        inProgress = true;
        update();
        await userAuth.registerWithEmailandPass(
          email: emailController.text,
          password: passController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          userName: userNameController.text,
          avatar: '',
        );

        Get.offAndToNamed(RoutesClass.getCreatePinRoute());
        inProgress = false;
        update();
      }
    } on FirebaseAuthException catch (e) {
      inProgress = false;
      update();
      Get.snackbar(
        "Error",
        e.message!,
        dismissDirection: DismissDirection.horizontal,
        colorText: Colors.white,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
