import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:calculator_app/Calculator_Neumorphic/calculatorPage.dart';
import 'OnBoard_Page1.dart';
import 'OnBoard_Page2.dart';
import 'OnBoard_Page3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  //Controller to keep track of the page we are on
  PageController _controller = PageController();
  
  //to check if we are on the last page
  bool onLastPage = false;

  _storeOnBoardInfo() async{
    int isViewed = 1 ;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard',isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              OnboardPage1(),
              OnboardPage2(),
              OnboardPage3()
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Skip Button

                GestureDetector(
                  onTap: (){
                    // _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    // _controller.previousPage(duration: Duration(milliseconds:500), curve: Curves.easeIn);
                    _controller.jumpToPage(2);
                  },

                    child: Text('skip', style: TextStyle(color: Colors.red,fontSize: 20),)),

                SmoothPageIndicator(controller: _controller, count: 3),

                //Next or Done Button

                onLastPage ?
                GestureDetector(
                    onTap: ()async{
                      await _storeOnBoardInfo();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Calculator2()),
                      );
                    },
                    child: Text('Done', style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),))
                    :
                GestureDetector(
                    onTap: (){
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Text('next', style: TextStyle(color: Colors.red,fontSize: 20),))  ,



              ],
            ),
          )
        ],
      )
    );
  }

}



