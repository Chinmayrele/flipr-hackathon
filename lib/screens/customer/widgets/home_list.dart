import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/models/restaurant.dart';
import 'package:zomato_hackathon/screens/customer/customer_detail_page.dart';
import 'package:zomato_hackathon/styles.dart';

class HomeList extends StatelessWidget {
  final Restaurant restaurant;
  final int index;
  const HomeList({Key? key, required this.restaurant, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => navigateTo(
          context: context,
          page: CustomerDetailPage(
            index: index,
          )),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
                height: 110,
                width: 95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: lightBlue,
                  image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover),
                )),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.title,
                  style: titleTextStyle,
                ),
                Text(
                  restaurant.address,
                  style: addressTextStyle,
                ),
                // Row(
                //   children: [
                //     const Text('•'),
                //     Icon(Icons.star, color: Colors.grey[600], size: 20),
                //     Text(
                //       '3.7',
                //       style: priceRatingTextStyle,
                //     ),
                //     const SizedBox(width: 5),
                //     Text('•43 min', style: priceRatingTextStyle),
                //     const SizedBox(width: 5),
                //     Text(
                //       '•\u20B9 250 for two',
                //       style: priceRatingTextStyle,
                //     )
                //   ],
                // ),
                // Container(
                //   height: 1,
                //   width: 200,
                //   color: Colors.grey,
                //   margin: const EdgeInsets.only(top: 5, bottom: 5),
                // ),
                // Row(
                //   children: [
                //     const Icon(
                //       Icons.brightness_7_outlined,
                //       color: kPrimaryColor,
                //     ),
                //     const SizedBox(width: 5),
                //     Text(
                //       '40% off upto \u20B970',
                //       style: TextStyle(color: Colors.grey[700], fontSize: 12),
                //     ),
                //   ],
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
