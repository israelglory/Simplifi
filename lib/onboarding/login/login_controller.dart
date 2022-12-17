import 'package:simplifi/routes/exports.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
}
