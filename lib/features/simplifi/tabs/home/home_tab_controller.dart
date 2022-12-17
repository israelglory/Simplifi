import 'package:simplifi/models/user/user_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  UserAuth userAuth = UserAuth();
  UserModel userData = UserModel();
  bool show = true;
  final noSimbolInUSFormat =
      NumberFormat.currency(locale: "en_US", symbol: "#");

  @override
  void onInit() async {
    await finalUserData();
    update();
    super.onInit();
  }

  Future<void> finalUserData() async {
    final userinfo = await userAuth.getUserData();
    print(userinfo);

    userData = UserModel(
      accountNumber: userinfo['accountNumber'],
      avatar: userinfo['avatar'],
      email: userinfo['email'],
      firstName: userinfo['firstName'],
      lastName: userinfo['lastName'],
      passWord: userinfo['passWord'],
      pin: userinfo['pin'],
      userName: userinfo['userName'],
      accountBalance: userinfo['accountBalance'],
    );
    update();
  }

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
