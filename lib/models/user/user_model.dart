import 'package:simplifi/routes/exports.dart';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String? pin;
  final String? accountNumber;
  final String? email;
  final String? userName;
  final String? passWord;
  final String? avatar;

  UserModel(
      {this.firstName,
      this.lastName,
      this.pin,
      this.accountNumber,
      this.email,
      this.userName,
      this.passWord,
      this.avatar});

  factory UserModel.fromFirestore(DocumentSnapshot map) {
    return UserModel(
      accountNumber: map['accountNumber'],
      avatar: map['avatar'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      passWord: map['passWord'],
      pin: map['pin'],
      userName: map['userName'],
    );
  }
}
