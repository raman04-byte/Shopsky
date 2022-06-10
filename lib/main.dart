import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shopsky/cartscreen.dart';
import 'package:shopsky/login.dart';
import 'package:shopsky/otp.dart';
import 'package:shopsky/register.dart';
import 'package:shopsky/splash.dart';
import 'package:shopsky/favorite.dart';
import 'package:shopsky/product.dart';
import 'package:shopsky/forget.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'forget',
    routes: {
      'splash':(context)=>const MySplash(),
      'login' : (context)=>const MyLogin(),
      'register':(context)=>  const MyRegister(),
      'cart':(context)=> const MyCart(),
      'favorite':(context)=>const MyFav(),
      'product':(context)=>const MyProduct(),
      'forget':(context)=>const MyForget(),
      'otp':(context)=>const MyOtp(),
    },
  ));
}

