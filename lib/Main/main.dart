// Importing Packages And Libraries
import 'package:flutter/material.dart';
import 'package:pmms/OnBoarding/OnBoarding_Screen.dart';

// Calling Main Method
void main() => runApp(MyApp());

// Main Widget
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return MaterialApp(

                // Splash Screen Widget
                home: OnBoarding_Screen(),
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
    );
  }
}

