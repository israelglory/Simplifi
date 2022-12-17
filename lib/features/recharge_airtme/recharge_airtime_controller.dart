import 'package:simplifi/components/dialogs/airtime_confirm_dialog.dart';
import 'package:simplifi/routes/exports.dart';

class RechargeAirtimeController extends GetxController {
  TextEditingController networkProvider = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController amount = TextEditingController();

  void onRechargeAirtime() {
    Get.defaultDialog(
      title: '',
      titlePadding: const EdgeInsets.all(0.0),
      contentPadding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      content: RechargeAirtimeDialog(
        onPressed: () {
          Get.toNamed(RoutesClass.getInputAirtimePinRoute());
        },
      ),
    );
  }
}
