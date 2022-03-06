import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/signin.dart';
import 'package:zomato_hackathon/common/location_handler.dart';
import 'package:zomato_hackathon/common/progress_indicator.dart';
import 'package:zomato_hackathon/common/selectpage.dart';
import 'package:zomato_hackathon/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocationHandler.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zomato Hackathon!',
      theme: appTheme,
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: progressIndicator());
            } else if (snapshot.hasData) {
              return const SelectViewScreen();
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
