import 'package:simplifi/components/dialogs/airtime_confirm_dialog.dart';
import 'package:simplifi/features/simplifi/bottom_nav_controller.dart';
import 'package:simplifi/models/banking/transaction/transfer_transaction_model.dart';
import 'package:simplifi/routes/exports.dart';

class RechargeAirtimeController extends GetxController {
  //TextEditingController networkProvider = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController amount = TextEditingController();
  String selectedNetwork = 'MTN';
  List<QueryDocumentSnapshot> beneficiaryList = [];
  int limit = 20;
  int limitIncrement = 20;
  final ScrollController listScrollController = ScrollController();

  @override
  void onInit() async {
    listScrollController.addListener(scrollListener);
    update();
    super.onInit();
  }

  List<String> listofNetworks = [
    'MTN',
    'GLO',
    '9Mobile',
    'Airtel',
  ];

  void bottomBankSelection() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(left: 16.0, top: 36.0, bottom: 16.0),
        //color: Colors.white,
        height: 400,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  selectedNetwork = listofNetworks[index];
                  update();
                  Get.back();
                },
                child: AppText(
                  listofNetworks[index],
                  size: 22,
                ));
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16.0,
            );
          },
          itemCount: listofNetworks.length,
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
    );
  }

  void onRechargeAirtime() {
    if (phoneNumber.text.isEmpty || amount.text.isEmpty) {
      Get.snackbar(
        "Error",
        'All fields must be filled',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    } else if (phoneNumber.text.length < 11 || phoneNumber.text.length > 11) {
      Get.snackbar(
        "Error",
        'Invalid phone number',
        colorText: Colors.white,
        dismissDirection: DismissDirection.horizontal,
        backgroundColor: AppColors.appRed,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.defaultDialog(
        title: '',
        titlePadding: const EdgeInsets.all(0.0),
        contentPadding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        content: RechargeAirtimeDialog(
          onPressed: () {
            Get.offAndToNamed(
              RoutesClass.getInputAirtimePinRoute(),
              arguments: TransferTransactionModel(
                accountNumber: phoneNumber.text,
                amount: int.parse(amount.text),
                bankName: selectedNetwork,
              ),
            );
            Get.delete<BottomNavController>();
          },
          receipt: TransferTransactionModel(
            accountNumber: phoneNumber.text,
            amount: int.parse(amount.text),
            bankName: selectedNetwork,
          ),
        ),
      );
    }
  }

  Stream<QuerySnapshot> getBeneficiaryFireStore() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('beneficiary')
        .where(
          'transactionType',
          isEqualTo: 'Airtime Recharge',
        )
        .snapshots();
  }

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      limit += limitIncrement;
      update();
    }
  }

  void onBeneficiarySelected(
    String bccNumber,
    String bankName,
  ) {
    selectedNetwork = bankName;
    phoneNumber.text = bccNumber;
    update();
  }
}
