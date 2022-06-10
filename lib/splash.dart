import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopsky/login.dart';

class MySplash extends StatefulWidget {
  const MySplash({Key? key}) : super(key: key);

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState(){
   super.initState();
   Timer(const Duration(seconds: 2), (){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> const MyLogin()));
   });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/shopsky.png', height: 120,)
            ,const SizedBox(
              height: 20,),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
