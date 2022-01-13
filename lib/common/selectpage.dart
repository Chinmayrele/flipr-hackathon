import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/customer/home_page.dart';
import 'package:zomato_hackathon/screens/restaurant/res_splash_screen.dart';
import 'package:zomato_hackathon/styles.dart';

class SelectViewScreen extends StatelessWidget {
  const SelectViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover)),
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black54, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  kAppTitle,
                  style: appTitleStyle,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: Text(
                  kAppDescription,
                  style: appDescriptionStyle,
                ),
              ),
              CustomButton(
                  title: const Text("Contine as Customer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onTap: () => replaceNavigateTo(
                      context: context, page: const CustomerHomePage()),
                  buttonType: ButtonType.text),
              CustomButton(
                  title: const Text("Contine as Restaurant",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  onTap: () => replaceNavigateTo(
                      context: context, page: const ResSplachScreen()),
                  buttonType: ButtonType.text),
              const SizedBox(
                height: 12,
              )
            ],
          ),
        ))
      ],
    ));
  }
}
