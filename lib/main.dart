import 'package:flutter/material.dart';
import 'package:liveasy_assignment/screens/main_screen.dart';
import 'package:liveasy_assignment/screens/profile_selection.dart';
import 'package:liveasy_assignment/screens/registration_screen.dart';
import 'package:liveasy_assignment/screens/verification_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id : (context) => MainScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        // VerificationScreen.id: (context) => VerificationScreen(),
        ProfileSelection.id: (context) => ProfileSelection(),
      },
    );
  }
}
