import 'package:dio/dio.dart';
import 'package:simplifi/models/banking/bank_detail_model.dart';

class BankDetailAPI {
  final _dio = Dio();
  Data bankDetails = Data();

  Future<void> fetchBankDetails(
      {required String accountNumber, required String bankCode}) async {
    _dio.options.headers.addAll({
      'Authorization': 'Bearer sk_test_0634e0228c80716f9215be6d3d85b1f9a9e69498'
    });
    Response response;
    response = await _dio.get(
        'https://api.paystack.co/bank/resolve?account_number=$accountNumber&bank_code=$bankCode');
    //print(response.data.toString());

    final bankDetail = (response.data?['data']);
    final finalBankDetail = Data.fromMap(bankDetail);
    //print(finalBanks[1]);
    print(bankDetail);
    bankDetails = finalBankDetail;
  }
}
