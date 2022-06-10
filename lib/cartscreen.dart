import 'package:flutter/material.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [Text('Your cart', style: TextStyle(color: Colors.black),
          ),
            Text('0 items',
            style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
