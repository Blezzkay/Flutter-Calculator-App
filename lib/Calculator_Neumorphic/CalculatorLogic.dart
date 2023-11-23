import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorLogic {
  String expression = '0';
  String displayInput = '';
  String answer = '';
  bool canAddDecimalPoint = true;
  bool canAddPercentage = true;

  String checkInput(String input) {


    //CLEAR BUTTON
    if (input == 'C') {
      expression = '0';
      displayInput = expression;
      answer = '';
      canAddDecimalPoint =true;
      canAddPercentage =true;
    }
    //DEL BUTTON
    if (input == '⌫') {
      canAddDecimalPoint =false;
      canAddPercentage =false;
      if (expression.isNotEmpty) {
        expression = expression.substring(0, expression.length - 1);
      }
      if (expression.isEmpty) {
        expression = '0';
      }
    }
    //NUMBER BUTTONS
    else if (input == '9' || input == '8' || input == '7' || input == '6' ||
        input == '5' || input == '4' || input == '3' || input == '2' ||
        input == '1' || input == '0') {
      //check if Expression is 0 and replace the 0  before adding a number to it
      if (expression == '0') {
        expression = input;
      } else {
        expression += input;
      }
    }

    //Operator Logic
    else if (input == '+' || input == '-' || input == 'x' || input == '/') {
      String lastCharacter = expression[expression.length - 1];
      if (lastCharacter == '+' || lastCharacter == '-' || lastCharacter == '/'
          || lastCharacter == 'x' || lastCharacter == '%'
          ) {
        expression = expression.substring(0, expression.length - 1) + input;
      } else {
        expression += input;

      }
      canAddDecimalPoint =true;
    }

    //Decimal Point LOGIC
    else if(input == '.'){
      if(canAddDecimalPoint){
        String lastCharacter = expression[expression.length - 1];
        if (lastCharacter == '.'){
          expression = expression.substring(0, expression.length - 1) + input;
        } else {
          expression += input;
        }
      }else{
        expression=expression;
      }
      canAddDecimalPoint =false;
    }

    //PERCENTAGE LOGIC

    else if(input == '%'){
      if(canAddPercentage){
        String lastCharacter = expression[expression.length - 1];
        if (lastCharacter == '%') {
          expression = expression.substring(0, expression.length - 1) + input;
        } else {
          expression += input;
        }
      }else{
        expression=expression;
      }
      canAddPercentage =false;
    }




        //Calculate Answer using maths expression package
    else if(input == '='){
        String finalInput = expression;
        finalInput   = finalInput.replaceAll('x', '*');

        Parser p = Parser();
        Expression exp = p.parse(finalInput);
        ContextModel cm = ContextModel();
        double result = exp.evaluate(EvaluationType.REAL, cm);


        String resultString = result.toString();

        if(resultString.endsWith('.0')){
          resultString = resultString.substring(0,resultString.length-2);
        }

        answer = '=  $resultString';
      }






    return input;
  }
}