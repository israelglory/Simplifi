import 'package:ezanimation/ezanimation.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/beneficiary/beneficiary_services.dart';
import 'package:simplifi/services/transaction_services/internal_transfer_services.dart';
import 'package:simplifi/utils/utils.dart';

class SimplifiProcessTransferController extends GetxController
    with GetTickerProviderStateMixin {
  InternalTransferService transfer = InternalTransferService();
  final transaction = Get.arguments as TransferTransactionModel;
  BeneficiaryService beneficiaryService = BeneficiaryService();
  EzAnimation ezAnimation =
      EzAnimation(200.0, 300.0, const Duration(seconds: 1));
  bool inProgress = false;
  bool isLoading = true;
  @override
  void onInit() async {
    super.onInit();
    animateIt();
  }

  void animateIt() async {
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

  @override
  void onClose() {
    super.onClose();
    ezAnimation.dispose();
    print('Disposed');
  }

  Future<void> sendMoney() async {
    try {
      final userinfo = await getAccountDetailsData();
      final rUid = userinfo['uid'];
      print(rUid);
      await transfer.onInternalTransfer(
          sender: transaction.sender!,
          amount: transaction.amount!,
          receiver: transaction.receiver!,
          accountNumber: transaction.accountNumber!,
          description: transaction.description!,
          receiverid: rUid);
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

  Future<void> onAddBeneficiary() async {
    final bankImage = getBankImage(transaction.bankName!);
    try {
      inProgress = true;
      update();
      await beneficiaryService.addTransferBeneficiary(
        bankName: transaction.bankName!,
        accountNumber: transaction.accountNumber!,
        fullName: transaction.receiver!,
        bankLogo: bankImage,
        bankCode: '',
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

  Future getAccountDetailsData() async {
    final docRef = FirebaseFirestore.instance
        .collection('accounts')
        .doc(transaction.accountNumber);

    final userData = docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return userData;
  }
}
