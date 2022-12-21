import 'package:simplifi/components/dialogs/transfer_money_confirm.dart';
import 'package:simplifi/models/banking/bank_detail_model.dart';
import 'package:simplifi/models/banking/bank_list.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/services/api_services/bank_detail_service.dart';
import 'package:simplifi/services/api_services/bank_list_service.dart';

class TransferMoneyController extends GetxController {
  TextEditingController accountNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController description = TextEditingController();

  List<Datum> listOfbanks = [];
  BankListApi bankApi = BankListApi();
  BankDetailAPI bankDetailAPI = BankDetailAPI();
  Data bankDetails = Data();
  late Datum selectedBank;

  @override
  void onInit() async {
    await getBanks();
    update();
    super.onInit();
  }

  Future<void> getBanks() async {
    await bankApi.fetchBank();
    listOfbanks = bankApi.listOfbanks;
    print(listOfbanks[1].name);
    selectedBank = listOfbanks[1];
    update();
  }

  void selectBank(Datum? newValue) {
    selectedBank = newValue!;
    update();
    print(newValue.name);
  }

  void getBankDetails() async {
    await bankDetailAPI.fetchBankDetails(
        accountNumber: accountNumber.text, bankCode: selectedBank.code);
    bankDetails = bankDetailAPI.bankDetails;
    update();
  }

  void onTransferMoney() {
    Get.defaultDialog(
      title: '',
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      content: TransferConfirmationDialog(
        onPressed: () {
          Get.toNamed(RoutesClass.getInputTransferPinRoute());
        },
      ),
    );
  }
}
