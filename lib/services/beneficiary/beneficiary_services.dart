import 'package:simplifi/routes/exports.dart';

class BeneficiaryService {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  Future<void> addTransferBeneficiary({
    required String bankName,
    required String accountNumber,
    required String fullName,
    required String bankCode,
    required String bankLogo,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('beneficiary')
        .doc(accountNumber);

    docRef.set({
      'transactionType': 'Money Transfer',
      'bankName': bankName,
      'bankCode': bankCode,
      'accountNumber': accountNumber,
      'bankLogo': bankLogo,
      'fullName': fullName,
    });
  }

  Future<void> addSimplifiTransferBeneficiary({
    required String bankName,
    required String accountNumber,
    required String fullName,
    required String bankCode,
    required String bankLogo,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('beneficiary')
        .doc(accountNumber);

    docRef.set({
      'transactionType': 'Money Transfer',
      'bankName': bankName,
      'bankCode': bankCode,
      'accountNumber': accountNumber,
      'bankLogo': bankLogo,
      'fullName': fullName,
    });
  }

  Future<void> addAirtimeBeneficiary({
    required String bankName,
    required String accountNumber,
    required String fullName,
    required String bankLogo,
  }) async {
    final docRef = _firestore
        .collection('users')
        .doc(_firebaseAuth.currentUser!.uid)
        .collection('beneficiary')
        .doc(accountNumber);

    docRef.set({
      'transactionType': 'Airtime Recharge',
      'bankName': bankName,
      'accountNumber': accountNumber,
      'bankLogo': bankLogo,
      'bankCode': '',
      'fullName': fullName,
    });
  }
}
