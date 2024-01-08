import 'package:local_auth/local_auth.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/models/user/user_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;
import 'package:simplifi/services/user_service/user_auth.dart';

class SimplifiInputTranserPinController extends GetxController {
  TextEditingController pinController = TextEditingController();
  final transaction = Get.arguments as TransferTransactionModel;
  UserAuth userAuth = UserAuth();
  UserModel userData = UserModel();

  @override
  void onInit() async {
    await finalUserData();
    update();
    await authenticateUser();
    super.onInit();
  }

  Future<void> finalUserData() async {
    final userinfo = await userAuth.getUserData();

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

  final _localAuthentication = LocalAuthentication();
  bool _isUserAuthorized = false;

  Future<void> authenticateUser() async {
    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticate(
        localizedReason: "Authenticate",
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (exception) {
      if (exception.code == local_auth_error.notAvailable ||
          exception.code == local_auth_error.passcodeNotSet ||
          exception.code == local_auth_error.notEnrolled) {
        Get.snackbar(
          "Error",
          'No Biometric Found. Please check your settings and set FaceID or TouchID',
          colorText: Colors.white,
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: AppColors.appRed,
          snackPosition: SnackPosition.TOP,
        );
      }
    }

    //if (!mounted) return;

    _isUserAuthorized = isAuthorized;
    if (_isUserAuthorized) {
      Get.offAndToNamed(RoutesClass.getSimplifiProcessTransferRoute(),
          arguments: transaction);
    }
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
      Get.offAndToNamed(RoutesClass.getSimplifiProcessTransferRoute(),
          arguments: transaction);
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
