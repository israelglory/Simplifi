import 'package:device_preview/device_preview.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
