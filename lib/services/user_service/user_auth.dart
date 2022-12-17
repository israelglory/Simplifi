import 'dart:math' as math;

import 'package:simplifi/routes/exports.dart';

class UserAuth {
  final _firestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  ///Registering with Email is done here in this function. Passing the required parameter will sign user up in the application.
  Future<void> registerWithEmailandPass({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String userName,
    required String avatar,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'avatar': avatar,
      'email': email,
      'passWord': password,
    });
  }

  /// User can login with Email and password by providing the email and pass word that have already been created.
  Future<UserCredential?> loginWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  ///Create Pin and get account number
  Future<void> createPin({
    required String pin,
  }) async {
    await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'pin': pin,
      'accountNumber': accountNumber().toString(),
    });
  }

  int accountNumber() {
    var rnd = math.Random();
    var next = rnd.nextDouble() * 10000000000;
    while (next < 1000000000) {
      next *= 10;
    }
    return next.toInt();
  }
}
