import 'package:flutter/material.dart';
import 'package:zomato_hackathon/auth/signin.dart';
import 'package:zomato_hackathon/common/selectpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zomato Hackathon',
        theme: ThemeData(
          fontFamily: "Poppins",
          primarySwatch: Colors.blue,
        ),
        home: SignInScreen());
  }
}
