import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/styles.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: ExpansionTile(
          title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("mydummy@gmail.com"),
                Text("Longitude:84.2254 Latitude:83.11450"),
                Text("Items : 4")
              ]),
          children: [
            const ListTile(
              title: Text("Dish Name"),
              subtitle: Text("₹20x4"),
            ),
            const ListTile(
              title: Text("Dish Name"),
              subtitle: Text("₹20x4"),
            ),
            const ListTile(
                title: Text(
              "Total : ₹220",
              style: dishNameStyle,
            )),
            Row(children: [
              Expanded(
                  child: CustomButton(
                      title: const Text("Reject"),
                      color: Colors.red,
                      onTap: () => {},
                      buttonType: ButtonType.text)),
              Expanded(
                  child: CustomButton(
                      title: const Text("Accept"),
                      onTap: () => {},
                      buttonType: ButtonType.text)),
            ])
          ],
        ),
      ),
    );
  }
}
