import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobiledevtest/app/logic/network_config.dart';
import 'package:mobiledevtest/app/presentations/colors.dart';
import 'package:mobiledevtest/core/authentication/screens/email_signin.dart';
import 'package:mobiledevtest/core/authentication/view%20model/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NetworkConfig.initNetworkConfig();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthViewmodel()),
          ],
          child: MaterialApp(
            title: 'Flutter Test',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme: const IconThemeData(color: Colors.black, size: 15),
              backgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 15,
                    height: 1.0,
                    fontWeight: FontWeight.w400,
                    color: XColors.textColor(),
                  ),
                  bodyText2: TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 15,
                    height: 1.0,
                    fontWeight: FontWeight.w400,
                    color: XColors.textColor(),
                  )),
              visualDensity: VisualDensity.adaptivePlatformDensity,
              primaryColor: XColors.mainColor(),
            ),
            home: child,
          ),
        );
      },
      child: const EmailSigninScreen(),
    );
  }
}
