import 'package:flutter/material.dart';
import 'package:calculator_app/Buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userinput = '0';
  var answer = '';

  final List<String> buttons = [
    'C','DEL','%','/',
    '7','8','9','x',
    '4','5','6','-',
    '1','2','3','+',
    '0','.','ANS','=',
  ];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor:Colors.deepPurple[50],

      body: Column(
        children: [Expanded(child:
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        child: Text(userinput,style: TextStyle(fontSize: 40),)),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.bottomRight,
                        child: Text(answer,style:TextStyle(fontSize: 35))),
                  ),
                )
              ],
            ),
          ),
        )),
          Expanded(
              flex: 2,
              child: Container(

                child: GridView.builder(
                  physics:NeverScrollableScrollPhysics() ,
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {

                    //Clear Input and Answer
                        if(index == 0) {
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                userinput = '0';
                                answer = '';
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.green,
                            textColor: Colors.white,);

                          //Delete
                        }else if(index == 1){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                              if(userinput.isNotEmpty ) {
                                if (userinput != '0') {
                                  userinput = userinput.substring(
                                      0, userinput.length - 1);
                                }
                                if(userinput.isEmpty){
                                  userinput = '0';

                                }
                                }else {
                                userinput = '0';
                              }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.red,
                            textColor: Colors.white,);

                          //equalButton
                        }else if(index == buttons.length-1){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                eqaulBtnPressed();
                             print('equal clicked');
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.orange,
                            textColor: Colors.white,);
                        }

                        //Plus Button
                        else if(index == 15){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                  if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                      lastCharacter == 'x' ||lastCharacter == '/' ||lastCharacter == '%'){
                                      userinput = '${userinput.substring(0, userinput.length - 1)}+';
                                  }else{
                                    userinput += '+';
                                  }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,);
                        }

                        //Minus Button
                        else if(index == 11){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                    lastCharacter == 'x' ||lastCharacter == '/' ||lastCharacter == '%'){
                                  userinput = '${userinput.substring(0, userinput.length - 1)}-';
                                }else{
                                  userinput += '-';
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,);
                        }
                        //Multiplication Button
                        else if(index == 7){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                    lastCharacter == 'x' ||lastCharacter == '/' ||lastCharacter == '%'){
                                  userinput = '${userinput.substring(0, userinput.length - 1)}x';
                                }else{
                                  userinput += 'x';
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,);
                        }
                        //Division Button
                        else if(index == 3){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                    lastCharacter == 'x' ||lastCharacter == '/' ||lastCharacter == '%'){
                                  userinput = '${userinput.substring(0, userinput.length - 1)}/';
                                }else{
                                  userinput += '/';
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,);
                        }
                        //Percentage Button
                        else if(index == 2){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                    lastCharacter == 'x' ||lastCharacter == '/'||lastCharacter == '%'){
                                  userinput = '${userinput.substring(0, userinput.length - 1)}%';
                                }else if(userinput.contains('%')){
                                  userinput += '';
                                }else{
                                  userinput += '%';
                                }

                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.deepPurple,
                            textColor: Colors.white,);
                        }

                        //Decimal Point Button
                        else if(index == buttons.length-3){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String lastCharacter = userinput[userinput.length-1];
                                if( lastCharacter == '+' ||lastCharacter == '-' ||lastCharacter == '.'||
                                    lastCharacter == 'x' ||lastCharacter == '/'||lastCharacter == '%') {
                                  userinput = '${userinput.substring(0, userinput.length - 1)}.';
                                }  else{
                                  userinput += '.';
                                }

                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.white,
                            textColor: Colors.black,);
                        }
                        //ANS Button
                        else if(index == buttons.length-2){
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                String newAnswer = answer.replaceAll('=', '').trim();
                               if(answer.isNotEmpty){
                                 userinput = newAnswer;
                                 answer = '';
                               }
                              });
                            },
                            buttonText: buttons[index],
                            color: Colors.cyan,
                            textColor: Colors.white,);
                        }


                        else{
                          return MyButton(
                            buttonTapped: (){
                              setState(() {
                                if(userinput == '0'){
                                  userinput = buttons[index];
                                }else{
                                  userinput += buttons[index];
                                }
                              });
                            },
                            buttonText: buttons[index],
                            color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.white,
                            textColor: isOperator(buttons[index]) ? Colors.white : Colors.deepPurple,);
                        };

                    },

          )),
          ),
        ],

      ),
    );
  }

bool isOperator (String x){
    if(x=='%'||x=='/'||x=='x'||x=='-'||x=='+'||x=='='){
        return true;
    }
    return false;
}

void  eqaulBtnPressed(){
    String finalInput = userinput;
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

}
