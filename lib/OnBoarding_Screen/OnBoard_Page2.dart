import 'package:flutter/material.dart';

class OnboardPage2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.black,
      child: Center(
        child: Text('This is a 2 in 1 Calculator App, Tap the orange switch button at the '
            'bottom left to switch to the next Calculator',style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
