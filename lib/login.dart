// import 'dart:html';

import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // width: 150,
      decoration:  const BoxDecoration(

        image: DecorationImage(

          image: AssetImage('assets/login.png'),//height : 300, width : 150
          fit: BoxFit.cover,
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top : 130),
              child : const Text('Welcome to Shopsky',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33
                ),),
            ),
            SingleChildScrollView(
              child: Container(

                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5
                ,right:35,
                left:35),
                child: Column(
                  children: [
                  TextField(
                    decoration: InputDecoration(
                     fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    obscureText: true,
                      decoration: InputDecoration(
                      fillColor: Colors.grey.shade100,
                      filled: true,
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  )
                  ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const Text('Sign in',style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700, color: Color(0xff4c505b)),),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, 'product_page');
                          },

                          icon : const Icon(Icons.arrow_forward),
                        ),
                      )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.pushNamed(context, 'register');
                        }, child: const Text('Sign UP', style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b),

                        ),)),
                        TextButton(onPressed: (){},
                           child: const Text('Forgot Password', style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 18,
                          color: Color(0xff4c505b),

                        ),))
                      ],
                    )
  ],
),
              ),
            )
            ],
        )
      ),
    );
  }
}
