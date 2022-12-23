import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/utils/utils.dart';

class SendTransferTransaction {
  String? date;
  Timestamp? timestamp;
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  ///When posting jobs/proposals we can pass the date and timestamp that have been formatted in the data that will be sent to the firebase
  Future _getDate() async {
    DateTime now = DateTime.now();
    String _date = DateFormat('dd MMMM yy').format(now);
    Timestamp _timestamp = Timestamp.now();
    timestamp = _timestamp;
    date = _date;
  }

  Future<void> sendTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String bankName,
    required String bankCode,
    required String accountNumber,
    required String description,
  }) async {
    await _getDate();
    final userinfo = await getUserData();
    var accountBalance = userinfo['accountBalance'];
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
    final bankLogo = getBankImage(bankName);
    final docRef = _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('transactions')
        .doc();
    if (accountBalance > amount) {
      docRef.set({
        'transactionDate': date,
        'transactionType': 'Money Transfer',
        'sender': sender,
        'amount': amount,
        'receiver': receiver,
        'bankName': bankName,
        'accountNumber': accountNumber,
        'description': description,
        'bankLogo': bankLogo,
        'bankCode': bankCode,
        'timeStamp': timestamp,
        'transactionState': 'debit',
        'referenceNumber': 'Ref${dateNow.millisecond}',
      });
      await debitAccount(amount);
    } else {
      Get.snackbar(
        "Error",
        'Incorrect Pin',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> debitAccount(int debitAmount) async {
    final docRef =
        _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid);
    final userinfo = await getUserData();
    var accountBalance = userinfo['accountBalance'];
    final newAcountBalnce = accountBalance - debitAmount;

    if (accountBalance > debitAmount) {
      docRef.update({'accountBalance': newAcountBalnce});
    } else {}
  }

  /// We can get user data through this function
  Future getUserData() async {
    final docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);

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
