import 'package:simplifi/routes/exports.dart';

class SignUpController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool show = true;
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
}
