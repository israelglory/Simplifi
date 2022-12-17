import 'package:simplifi/models/user/user_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';

class ReAuthController extends GetxController {
  TextEditingController pinController = TextEditingController();
  UserAuth userAuth = UserAuth();
  UserModel userData = UserModel();

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
    );
    update();
  }

  void onCompleted(String pin) {
    if (userData.pin != pin) {
      Get.snackbar(
        "Error",
        'Incorrect Pin',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
      pinController.clear();
      update();
    } else {
      Get.offAndToNamed(RoutesClass.getBottomNavHomeRoute());
    }
  }

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

  void logOut() async {
    await userAuth.logOut();
    Get.toNamed(RoutesClass.getLoginRoute());
  }
}
