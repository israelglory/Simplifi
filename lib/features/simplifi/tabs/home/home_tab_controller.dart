import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
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
  List<QueryDocumentSnapshot> transactionList = [];
  List<TransferTransactionModel> processedTransactionList = [];
  int limit = 20;
  int limitIncrement = 20;
  List<QueryDocumentSnapshot> beneficiaryList = [];
  final ScrollController listScrollController = ScrollController();
  final ScrollController benelistScrollController = ScrollController();

  @override
  void onInit() async {
    await finalUserData();
    listScrollController.addListener(scrollListener);
    benelistScrollController.addListener(benescrollListener);
    update();
    super.onInit();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }

  Stream<QuerySnapshot> getStreamFireStore() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('transactions')
        .orderBy('timeStamp', descending: true)
        .snapshots();
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

  Stream<QuerySnapshot> getBeneficiaryFireStore() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('beneficiary')
        .where(
          'transactionType',
          isEqualTo: 'Money Transfer',
        )
        .snapshots();
  }

  void benescrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }
}
