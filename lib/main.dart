import 'package:flutter/material.dart';
import 'package:shopsky/cartscreen.dart';
import 'package:shopsky/home.dart';
import 'package:shopsky/login.dart';
import 'package:shopsky/otp.dart';
import 'package:shopsky/register.dart';
import 'package:shopsky/splash.dart';
import 'package:shopsky/favorite.dart';
import 'package:shopsky/product.dart';
import 'package:shopsky/forget.dart';
import 'package:shopsky/register_otp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shopsky/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "XXX",
      appId: "XXX",
      messagingSenderId: "XXX",
      projectId: "XXX",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopsky',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {//
        'splash': (context) => const MySplash(),
        'login': (context) => const MyLogin(),
        'register': (context) => const MyRegister(),
        'cart': (context) => const MyCart(),
        'favorite': (context) => const MyFav(),
        'product': (context) => const MyProduct(),
        'forget': (context) => const MyForget(),
        'otp': (context) => const MyOtp(),
        'home': (context) => const MyHome(),
        'register_otp': (context) => const MyRegOTP(),
      },
    );
  }
}
