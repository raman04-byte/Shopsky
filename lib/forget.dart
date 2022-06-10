import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyForget extends StatefulWidget {
  const MyForget({Key? key}) : super(key: key);

  @override
  State<MyForget> createState() => _MyForgetState();
}

class _MyForgetState extends State<MyForget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/login.png'), //height : 300, width : 150
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 130),
                child: const Text(
                  'Enter your number',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.5,
                      right: 35,
                      left: 35),
                  child: Column(
                    children: [
                      TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: 'Phone Number',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      const SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: (
                                  ) {
                                Fluttertoast.showToast(
                                  msg: 'OTP sent',
                                  toastLength: Toast.LENGTH_SHORT,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.white,
                                  textColor: Colors.black,
                                  fontSize: 16.0,
                                );
                              },
                              child: const Text(
                                'Send OTP',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b),
                                ))),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: const Text(
                                'Sign UP',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b),
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '');
                              },
                              child: const Text(
                                'Enter OTP',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b),
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
