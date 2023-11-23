// import 'package:calculator_app/calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Calculator_Neumorphic/calculatorPage.dart';
import 'OnBoarding_Screen/OnBoardingScreen.dart';

int? isViewed;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed =  prefs.getInt('onBoard');
  print(isViewed);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isViewed ==null ? OnBoardingScreen() : Calculator2(),
      );
  }
}
