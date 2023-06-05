import 'package:flutter/material.dart';
import 'OnbardingScreen.dart';// Import the OnboardingScreen.dart file
 
import 'HomeScreen.dart'; // Import the HomeScreen.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnboardingScreen(), // Set the initial screen to the onboarding screen
    );
  }
}
