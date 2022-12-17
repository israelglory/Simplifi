import 'package:simplifi/features/pin/create_pin/create_pin_view.dart';
import 'package:simplifi/features/pin/update_pin/update_pin_view.dart';
import 'package:simplifi/features/re_auth/re_auth_view.dart';
import 'package:simplifi/features/recharge_airtme/airtime_auth_pin/input_airtime_pin_view.dart';
import 'package:simplifi/features/recharge_airtme/processing_airtime/processing_airtime_view.dart';
import 'package:simplifi/features/recharge_airtme/receipt/airtime_receipt_view.dart';
import 'package:simplifi/features/recharge_airtme/recharge_airtime_view.dart';
import 'package:simplifi/features/simplifi/bottom_nav_view.dart';
import 'package:simplifi/features/simplifi/tabs/home/home_tab_view.dart';
import 'package:simplifi/features/trensfer_money/processing_transfer/processing_transfer_view.dart';
import 'package:simplifi/features/trensfer_money/receipt/transfer_receipt_view.dart';
import 'package:simplifi/features/trensfer_money/transfer_auth_pin/input_transfer_pin_view.dart';
import 'package:simplifi/features/trensfer_money/transfer_money_view.dart';
import 'package:simplifi/intro/intropage_view.dart';
import 'package:simplifi/onboarding/login/login_view.dart';
import 'package:simplifi/onboarding/sign_up/sign_up_view.dart';
import 'package:simplifi/splash/splash_screen.dart';

import 'exports.dart';

class RoutesClass {
  // Onboarding Routes
  static const String splashScreen = '/splash/onboarding';
  // Intro Routes
  static const String intro = '/intro';
  // URLS
  // Authentication Routes
  static const String registerAccount = '/auth/register';
  static const String loginAccount = '/auth/login';
  static const String reAuth = '/auth/reAuth';

  //home
  static const String home = '/home';

  //bottomNav
  static const String bottomNavHome = '/bottomNavHome';

  //features
  static const String transferMoney = '/feature/transferMoney';
  static const String processTransfer = '/feature/processTransfer';
  static const String transferReceipt = '/feature/transferReceipt';
  static const String rechargeAirtime = '/feature/rechargeAirtime';
  static const String processAirtime = '/feature/processAirtime';
  static const String airtimeReceipt = '/feature/airtimeReceipt';

  //Pin
  static const String createPin = '/feature/createPin';
  static const String updatePin = '/feature/updatePin';
  static const String inputTransferPin = '/feature/inputTransferPin';
  static const String inputAirtimePin = '/feature/inputAirtimePin';

  // GETTERS
  // Authentication Routes
  static String getRegisterRoute() => registerAccount;
  static String getLoginRoute() => loginAccount;
  static String getReAuthRoute() => reAuth;

  //Splash Screen
  static String getSplashScreenRoute() => splashScreen;
  //Intro Screen
  static String getIntroScreenRoute() => intro;

  //Home
  static String getHomeRoute() => home;
  static String getBottomNavHomeRoute() => bottomNavHome;

  ///Feature
  static String getTransferMoneyRoute() => transferMoney;
  static String getProcessTransferRoute() => processTransfer;
  static String getTransferReceiptRoute() => transferReceipt;
  static String getRechargeAirtimeRoute() => rechargeAirtime;
  static String getProcessAirtimeRoute() => processAirtime;
  static String getAirtimeReceiptRoute() => airtimeReceipt;

  //Pin
  static String getCreatePinRoute() => createPin;
  static String getUpdatePinRoute() => updatePin;
  static String getInputTransferPinRoute() => inputTransferPin;
  static String getInputAirtimePinRoute() => inputAirtimePin;

  // ROUTING FUNCTION
  static List<GetPage> routes = [
    // AUTHENTICATION ROUTES
    GetPage(
      name: getRegisterRoute(),
      page: () => const SignUpView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getLoginRoute(),
      page: () => const LoginView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getReAuthRoute(),
      page: () => const ReAuthView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getBottomNavHomeRoute(),
      page: () => const BottomNavigationView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getIntroScreenRoute(),
      page: () => const IntroPageView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getSplashScreenRoute(),
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getHomeRoute(),
      page: () => const HomeView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),

    ///Feature
    GetPage(
      name: getTransferMoneyRoute(),
      page: () => const TransferMoneyView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getRechargeAirtimeRoute(),
      page: () => const RechargeAirtimeView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    //Pin
    GetPage(
      name: getCreatePinRoute(),
      page: () => const CreatePinView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getUpdatePinRoute(),
      page: () => const UpdatePinView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getInputTransferPinRoute(),
      page: () => const InputTransferPinView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getInputAirtimePinRoute(),
      page: () => const InputAirtimePinView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),

    ///Feature
    GetPage(
      name: getProcessTransferRoute(),
      page: () => const ProcessTransferView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getTransferReceiptRoute(),
      page: () => const TransferReceiptView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getAirtimeReceiptRoute(),
      page: () => const AirtimeReceiptView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
    GetPage(
      name: getProcessAirtimeRoute(),
      page: () => const ProcessAirtimeView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 0, milliseconds: 400),
      curve: Curves.fastOutSlowIn,
    ),
  ];
}
