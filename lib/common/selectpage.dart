import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/buttons.dart';

class SelectViewScreen extends StatelessWidget {
  const SelectViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Spacer(),
        CustomButton(
            title: const Text("Contine as Customer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () => {},
            buttonType: ButtonType.text),
        CustomButton(
            title: const Text("Contine as Restaurant",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () => {},
            buttonType: ButtonType.text),
      ],
    ));
  }
}
