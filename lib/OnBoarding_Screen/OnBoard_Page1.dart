import 'package:flutter/material.dart';

class OnboardPage1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('Welcome to CALC MASTER',style: TextStyle(
          color:  Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
