// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:simplifi/models/banking/bank_list.dart';
import 'package:simplifi/routes/exports.dart';

class BeneficiaryModel {
  final String? fullName;
  final String? accountNumber;
  final String? bankName;
  final String? bankLogo;
  final String? bankCode;

  BeneficiaryModel({
    this.fullName,
    this.accountNumber,
    this.bankName,
    this.bankLogo,
    this.bankCode,
  });

  factory BeneficiaryModel.fromFirestore(DocumentSnapshot map) {
    return BeneficiaryModel(
        fullName: map['fullName'],
        bankName: map['bankName'],
        bankLogo: map['bankLogo'],
        accountNumber: map['accountNumber'],
        bankCode: map['bankCode']);
  }
}
