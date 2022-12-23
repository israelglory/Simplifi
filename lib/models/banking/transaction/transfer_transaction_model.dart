// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:simplifi/routes/exports.dart';

class TransferTransactionModel {
  final String? transactionDate;
  final String? transactionType;
  final String? sender;
  final int? amount;
  final String? receiver;
  final String? bankName;
  final String? bankCode;
  final String? bankLogo;
  final String? accountNumber;
  final String? description;
  final String? referenceNumber;
  final String? transactionState;
  final Timestamp? timeStamp;
  TransferTransactionModel(
      {this.transactionDate,
      this.transactionType,
      this.sender,
      this.amount,
      this.receiver,
      this.bankName,
      this.accountNumber,
      this.description,
      this.bankLogo,
      this.bankCode,
      this.transactionState,
      this.referenceNumber,
      this.timeStamp});

  factory TransferTransactionModel.fromFirestore(DocumentSnapshot map) {
    return TransferTransactionModel(
      transactionDate: map['transactionDate'],
      transactionType: map['transactionType'],
      sender: map['sender'],
      amount: map['amount'],
      receiver: map['receiver'],
      bankName: map['bankName'],
      bankLogo: map['bankLogo'],
      bankCode: map['bankCode'],
      transactionState: map['transactionState'],
      accountNumber: map['accountNumber'],
      description: map['description'],
      referenceNumber: map['referenceNumber'],
      timeStamp: map['timeStamp']!,
    );
  }
}
