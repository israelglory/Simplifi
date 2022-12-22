import 'package:simplifi/features/recharge_airtme/recharge_airtime_view.dart';
import 'package:simplifi/features/simplifi/tabs/home/home_tab_view.dart';
import 'package:simplifi/features/simplifi/tabs/more/more_tab_view.dart';
import 'package:simplifi/features/simplifi/tabs/savings/savings_tab_view.dart';
import 'package:simplifi/features/simplifi/tabs/simplifi_trensfer_money/simplifi_transfer_money_view.dart';
import 'package:simplifi/features/trensfer_money/transfer_money_view.dart';
import 'package:simplifi/routes/exports.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  final List children = [
    const HomeView(),
    const TransferMoneyView(),
    const RechargeAirtimeView(),
    const SimplifiTransferMoneyView(),
    const MoreTabView(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
