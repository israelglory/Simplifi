import 'package:ezanimation/ezanimation.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/beneficiary/beneficiary_services.dart';
import 'package:simplifi/services/transaction_services/buy_airtime_service.dart';
import 'package:simplifi/utils/utils.dart';

class ProcessAirtimeController extends GetxController {
  EzAnimation ezAnimation =
      EzAnimation(200.0, 300.0, const Duration(seconds: 1));
  bool isLoading = true;
  BuyAirtimeService buyAirtime = BuyAirtimeService();
  BeneficiaryService beneficiaryService = BeneficiaryService();
  bool inProgress = false;
  final transaction = Get.arguments as TransferTransactionModel;
  @override
  void onInit() async {
    super.onInit();
    await animateIt();
  }

  Future<void> animateIt() async {
    isLoading = true;
    update();
    ezAnimation.start();
    update();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    ezAnimation.repeat(rev: true);
    update();

    await sendMoney();

    ezAnimation.stop();
    update();
    isLoading = false;
    update();
  }

  Future<void> onAddBeneficiary() async {
    final bankImage = getProviderImage(transaction.bankName!);
    try {
      inProgress = true;
      update();
      await beneficiaryService.addAirtimeBeneficiary(
        bankName: transaction.bankName!,
        accountNumber: transaction.accountNumber!,
        fullName: transaction.receiver!,
        bankLogo: bankImage,
      );
      inProgress = false;
      update();
    } on FirebaseException catch (e) {
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

  Future<void> sendMoney() async {
    try {
      await buyAirtime.buyAirtime(
        amount: transaction.amount!,
        bankName: transaction.bankName!,
        accountNumber: transaction.accountNumber!,
      );
    } on FirebaseException catch (e) {
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

  @override
  void onClose() {
    super.onClose();
    ezAnimation.dispose();
    print('Dispos');
  }
}
