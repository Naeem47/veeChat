import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veechat/Constants/colors.dart';
import 'package:veechat/Provider/Loginprovider.dart';
import 'package:veechat/Provider/Signupprovider.dart';
import 'package:veechat/Screens/Splashscreen.dart';
import 'package:veechat/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, 
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorConstants.white,
          appBarTheme: const AppBarTheme(
            backgroundColor: ColorConstants.white,
          ),
        ),
        home: const SplashView(),
      ),
    );
  }
}
