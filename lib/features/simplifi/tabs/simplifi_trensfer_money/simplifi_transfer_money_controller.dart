import 'package:simplifi/components/dialogs/transfer_money_confirm.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/models/user/user_model.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/user_service/user_auth.dart';

class SimplifiTransferMoneyController extends GetxController {
  TextEditingController accountNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();
  String accName = '';
  UserModel userData = UserModel();
  UserAuth userAuth = UserAuth();
  String receiverUid = '';
  List<QueryDocumentSnapshot> beneficiaryList = [];
  int limit = 20;
  int limitIncrement = 20;
  final ScrollController listScrollController = ScrollController();

  @override
  void onInit() async {
    await finalUserData();
    listScrollController.addListener(scrollListener);
    update();
    super.onInit();
  }

  Future<void> resolveAccount() async {
    final docRef = FirebaseFirestore.instance
        .collection('accounts')
        .doc(accountNumber.text);
    final userinfo = await getAccountDetailsData();
    //var receiverAccountBalance = userinfo['accountNumber'];
    var rUid = userinfo['uid'];
    var receiverFirstName = userinfo['firstName'];
    var receiverLastName = userinfo['lastName'];

    DocumentSnapshot snap = await docRef.get();
    if (snap.exists) {
      accName = '$receiverFirstName $receiverLastName';
      receiverUid = rUid;
      update();
    } else {
      accName = 'Invalid Account';
      update();
    }
  }

  Future getAccountDetailsData() async {
    final docRef = FirebaseFirestore.instance
        .collection('accounts')
        .doc(accountNumber.text);

    final userData = docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data();
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return userData;
  }

  void onTransferMoney() {
    if (accName == 'Invalid Account') {
      Get.snackbar(
        "Error",
        'Check Account number or your internet connection',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
      update();
    } else if (int.parse(amount.text) >= userData.accountBalance!) {
      Get.snackbar(
        "Error",
        'Insufficient balance',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
      update();
    } else if (accountNumber.text == userData.accountNumber!) {
      Get.snackbar(
        "Error",
        'You cannot send money to yourself',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.defaultDialog(
        title: '',
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        content: TransferConfirmationDialog(
          receipt: TransferTransactionModel(
            sender: '${userData.firstName} ${userData.lastName}',
            accountNumber: accountNumber.text,
            amount: int.parse(amount.text),
            bankName: 'Simplifi',
            receiver: accName,
            description: description.text,
          ),
          onPressed: () {
            Get.toNamed(
              RoutesClass.getInputSimplifiTransferPinRoute(),
              arguments: TransferTransactionModel(
                sender: '${userData.firstName} ${userData.lastName}',
                accountNumber: accountNumber.text,
                amount: int.parse(amount.text),
                bankName: 'Simplifi',
                receiver: accName,
                description: description.text,
              ),
            );
            //Get.back();
            //clearAllText();
          },
        ),
      );
    }
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
      accountBalance: userinfo['accountBalance'],
    );
    update();
  }

  @override
  void onClose() {
    super.onClose();
    clearAllText();
  }

  void clearAllText() {
    accountNumber.clear();
    bankName.clear();
    description.clear();
    amount.clear();
  }

  Stream<QuerySnapshot> getBeneficiaryFireStore() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('beneficiary')
        .where(
          'bankName',
          isEqualTo: 'Simplifi',
        )
        .snapshots();
  }

  void resetAccName() {
    accName = '';
    update();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }

  void onBeneficiarySelect(
    String accNumber,
  ) async {
    accountNumber.text = accNumber;
    update();
    final docRef = FirebaseFirestore.instance
        .collection('accounts')
        .doc(accountNumber.text);
    final userinfo = await getAccountDetailsData();
    //var receiverAccountBalance = userinfo['accountNumber'];
    var rUid = userinfo['uid'];
    var receiverFirstName = userinfo['firstName'];
    var receiverLastName = userinfo['lastName'];

    DocumentSnapshot snap = await docRef.get();
    if (snap.exists) {
      accName = '$receiverFirstName $receiverLastName';
      receiverUid = rUid;
      update();
    } else {
      accName = 'Invalid Account';
      update();
    }
  }
}
