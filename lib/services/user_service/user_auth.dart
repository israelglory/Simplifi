import 'dart:math' as math;

import 'package:simplifi/models/user/user_model.dart';
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
    final accountNumber = getaccountNumber().toString();
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
      'accountNumber': accountNumber,
    });
    await accountSetting(
      email: email,
      firstName: firstName,
      lastName: lastName,
      accountNumber: accountNumber,
    );
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
    });
  }

  ///Registering with Email is done here in this function. Passing the required parameter will sign user up in the application.
  Future<void> accountSetting({
    required String email,
    required String firstName,
    required String lastName,
    required String accountNumber,
  }) async {
    await _firestore.collection('accounts').doc(accountNumber).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'accountNumber': accountNumber,
      'uid': FirebaseAuth.instance.currentUser!.uid,
    });
  }

  int getaccountNumber() {
    var rnd = math.Random();
    var next = rnd.nextDouble() * 10000000000;
    while (next < 1000000000) {
      next *= 10;
    }
    return next.toInt();
  }

  Future<UserModel> userData() async {
    final userinfo = await getUserData();

    final user = UserModel(
      accountNumber: userinfo['accountNumber'],
      avatar: userinfo['avatar'],
      email: userinfo['email'],
      firstName: userinfo['firstName'],
      lastName: userinfo['lastName'],
      passWord: userinfo['passWord'],
      pin: userinfo['pin'],
      userName: userinfo['userName'],
    );
    return user;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
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
