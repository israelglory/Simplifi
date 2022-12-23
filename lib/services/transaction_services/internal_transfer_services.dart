import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/utils/utils.dart';

class InternalTransferService {
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

  Future<void> onInternalTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String receiverid,
    required String accountNumber,
    required String description,
  }) async {
    final userinfo = await getUserData();
    var accountBalance = userinfo['accountBalance'];
    if (accountBalance >= amount) {
      await senderTransfer(
        sender: sender,
        amount: amount,
        receiver: receiver,
        accountNumber: accountNumber,
        description: description,
      );

      await receiverTransfer(
        sender: sender,
        amount: amount,
        receiver: receiver,
        receiverid: receiverid,
        accountNumber: accountNumber,
        description: description,
      );
    }
  }

  Future<void> senderTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String accountNumber,
    required String description,
  }) async {
    await _getDate();
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
    final bankLogo = getBankImage('Simplifi');
    final docRef = _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('transactions')
        .doc();
    await docRef.set(
      {
        'transactionDate': date,
        'transactionType': 'Money Transfer',
        'sender': sender,
        'amount': amount,
        'receiver': receiver,
        'bankName': 'Simplifi',
        'accountNumber': accountNumber,
        'bankLogo': bankLogo,
        'bankCode': '',
        'timeStamp': timestamp,
        'description': description,
        'transactionState': 'debit',
        'referenceNumber': 'Ref${dateNow.millisecond}',
      },
    );
    await debitAccount(amount);
  }

  Future<void> receiverTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String receiverid,
    required String accountNumber,
    required String description,
  }) async {
    await _getDate();
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
    final bankLogo = getBankImage('Simplifi');
    final docRef = _firestore
        .collection('users')
        .doc(receiverid)
        .collection('transactions')
        .doc();
    await docRef.set(
      {
        'transactionDate': date,
        'transactionType': 'Money Transfer',
        'sender': sender,
        'amount': amount,
        'receiver': receiver,
        'bankName': 'Simplifi',
        'bankLogo': bankLogo,
        'bankCode': '',
        'accountNumber': accountNumber,
        'description': description,
        'timeStamp': timestamp,
        'transactionState': 'credit',
        'referenceNumber': 'Ref${dateNow.millisecond}',
      },
    );
    await creditAccount(amount, receiverid);
  }

  Future<void> debitAccount(int debitAmount) async {
    final docRef =
        _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid);
    final userinfo = await getUserData();
    var accountBalance = userinfo['accountBalance'];
    final newAcountBalnce = accountBalance - debitAmount;

    if (accountBalance > debitAmount) {
      docRef.update({'accountBalance': newAcountBalnce});
    } else {
      //print('Insufficient Balace');
    }
  }

  Future<void> creditAccount(int creditAmount, String receiverId) async {
    final docRef = _firestore.collection('users').doc(receiverId);
    final userinfo = await getReceiverData(receiverId);
    var accountBalance = userinfo['accountBalance'];
    final newAcountBalnce = accountBalance + creditAmount;

    await docRef.update({'accountBalance': newAcountBalnce});
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

  /// We can get user data through this function
  Future getReceiverData(String receiverId) async {
    final docRef =
        FirebaseFirestore.instance.collection('users').doc(receiverId);

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
