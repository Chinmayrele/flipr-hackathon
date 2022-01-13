import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/screens/restaurant/create_restaurant.dart';

class AskCreateRestaurant extends StatelessWidget {
  const AskCreateRestaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 50,
            ),
            const Text("No Registered Restaurent found for this Email."),
            CustomButton(
                title: const Text("Create Restaurent"),
                onTap: () {
                  replaceNavigateTo(
                      context: context, page: const CreateRestaurant());
                },
                buttonType: ButtonType.text)
          ],
        ),
      ),
    );
  }
}
