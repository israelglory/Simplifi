import 'package:jiffy/jiffy.dart';
import 'package:simplifi/routes/exports.dart';

class InternalTransferService {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> onInternalTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String receiverid,
    required String accountNumber,
    required String description,
  }) async {
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

  Future<void> senderTransfer({
    required String sender,
    required int amount,
    required String receiver,
    required String accountNumber,
    required String description,
  }) async {
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
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
    DateTime dateNow = DateTime.now();
    final date = Jiffy(dateNow).format('dd-MM-yyyy');
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
        'accountNumber': accountNumber,
        'description': description,
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
      print('Insufficient Balace');
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
