import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.buttonText,required this.textColor,this.buttonBgColor,this.fontSize,required this.buttonPressed});
  final String buttonText;
  final Color textColor;
  Color? buttonBgColor;
  double? fontSize;
  final buttonPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: buttonBgColor??Colors.transparent,
        padding: EdgeInsets.all(40),

      ),
      onPressed: buttonPressed,
      child: Text(buttonText,
        style:GoogleFonts.patrickHand(
          fontSize: fontSize ?? 30,
          color: textColor,
          fontWeight: FontWeight.bold,
        ) ,),
    );
  }
}
