import 'package:dio/dio.dart';
import 'package:simplifi/models/banking/bank_list.dart';

class BankListApi {
  final _dio = Dio();
  List<Datum> listOfbanks = [];

  Future<void> fetchBank() async {
    _dio.options.headers.addAll({
      'Authorization': 'Bearer sk_test_0634e0228c80716f9215be6d3d85b1f9a9e69498'
    });
    Response response;
    response = await _dio.get('https://api.paystack.co/bank');
    //print(response.data.toString());

    final banks = (response.data?['data'] as List);
    final finalBanks = banks.map((e) => Datum.fromMap(e)).toList();
    //print(finalBanks[1]);
    listOfbanks = finalBanks;
  }
}
