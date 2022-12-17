import 'package:device_preview/device_preview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simplifi/component_test.dart';
import 'package:simplifi/features/pin/auth_pin/input_pin_view.dart';
import 'package:simplifi/features/recharge_airtme/receipt/airtime_receipt_view.dart';
import 'package:simplifi/features/recharge_airtme/recharge_airtime_view.dart';
import 'package:simplifi/features/simplifi/bottom_nav_view.dart';
import 'package:simplifi/features/trensfer_money/processing_transfer/processing_transfer_view.dart';
import 'package:simplifi/features/trensfer_money/receipt/transfer_receipt_view.dart';
import 'package:simplifi/features/trensfer_money/transfer_money_view.dart';
import 'package:simplifi/onboarding/login/login_view.dart';
import 'package:simplifi/onboarding/sign_up/sign_up_view.dart';
import 'package:simplifi/routes/exports.dart';
import 'package:simplifi/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await Firebase.initializeApp();
  }

  runApp(
    //
    /*DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),*/

    const MyApp(),
  );

  //
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          //
          theme: ThemeData(
            primarySwatch: MaterialColor(0xFF10225e, AppColors.primarySwatch),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme),
          ),
          home: const SplashScreen(),
          getPages: RoutesClass.routes,
        );
      },
    );
  }
}
