import 'package:calculator_app/Calculator_Neumorphic/CalculatorLogic.dart';
import 'package:calculator_app/calculator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'RoundButton.dart';

class Calculator2 extends StatefulWidget {
  const Calculator2({super.key});

  @override
  State<Calculator2> createState() => _Calculator2State();
}

class _Calculator2State extends State<Calculator2> {
  CalculatorLogic logic = CalculatorLogic();
  String result = '';
  String input = '';


  @override
  Widget build(BuildContext context) {
    input = logic.expression;
    result = logic.answer;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Expanded(
              flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,bottom: 50,top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //Input Container
                      Container(
                        alignment:Alignment.bottomRight ,
                      width: MediaQuery.of(context).size.width*1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                            input,
                            style: GoogleFonts.patrickHand(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ),
            ),
                      //Result Container
                      Container(
                        alignment:Alignment.bottomRight ,
                        width: MediaQuery.of(context).size.width*1,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Text(
                              result,
                              style: GoogleFonts.patrickHand(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RoundButton(buttonText: 'C', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('C');
                           });
                         },),
                        RoundButton(buttonText: '⌫', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('⌫');
                           });
                         },),
                        RoundButton(buttonText: '%', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('%');
                           });
                         },),
                        RoundButton(buttonText: '/', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('/');
                           });
                         },),

                      ],

                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RoundButton(buttonText: '7', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('7');
                           });
                         },),
                        RoundButton(buttonText: '8', textColor:Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('8');
                           });
                         },),
                        RoundButton(buttonText: '9', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('9');
                           });
                         },),
                        RoundButton(buttonText: 'x', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('x');
                           });
                         },),

                      ],

                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RoundButton(buttonText: '4', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('4');
                           });
                         },),
                        RoundButton(buttonText: '5', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('5');
                           });
                         },),
                        RoundButton(buttonText: '6', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('6');
                           });
                         },),
                        RoundButton(buttonText: '-', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('-');
                           });
                         },),

                      ],

                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RoundButton(buttonText: '1', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('1');
                           });
                         },),
                        RoundButton(buttonText: '2', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('2');
                           });
                         },),
                        RoundButton(buttonText: '3', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('3');
                           });
                         },),
                        RoundButton(buttonText: '+', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('+');
                           });
                         },),

                      ],

                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RoundButton(buttonText: '🔁', textColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 // logic.checkInput('Z');
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => Calculator()),
                                 );
                           });
                         },),
                        RoundButton(buttonText: '0', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('0');
                           });
                         },),
                        RoundButton(buttonText: '.', textColor: Colors.white, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('.');
                           });
                         },),
                        RoundButton(buttonText: '=', textColor: Colors.white,buttonBgColor: Colors.orange, buttonPressed: (){
                           setState(() {
                                 logic.checkInput('=');
                           });
                         },),

                      ],

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


