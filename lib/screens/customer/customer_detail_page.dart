import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/customer.dart';
// import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/customer/widgets/customer_detail_list.dart';
import 'package:zomato_hackathon/screens/restaurant/create_restaurant.dart';
import 'package:zomato_hackathon/screens/restaurant/orders_screen.dart';

import '../../styles.dart';

class CustomerDetailPage extends StatefulWidget {
  final int index;
  CustomerDetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomerDetailPage> createState() => _CustomerDetailPageState();
}

class _CustomerDetailPageState extends State<CustomerDetailPage> {
  // int quantity = 0;
  // _addQuantity() {
  //   if (quantity > 0) {}
  //   quantity++;
  // }

  // _subtractQuantity() {
  //   if (quantity == 0) {
  //     null;
  //   } else {
  //     quantity--;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context: context, page: const OrdersScreen());
            },
            icon: const Icon(EvaIcons.archive),
            iconSize: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              color: kPrimaryColor,
              child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 180,
                            width: 80,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      allrestaurents[widget.index].imageUrl,
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allrestaurents[widget.index].title,
                                style: restaurantNameStyle,
                              ),
                              Text(
                                allrestaurents[widget.index].address,
                                style: restaurantAddrssStyle,
                              ),
                            ],
                          )
                        ],
                      )))),
          Expanded(
            child: Container(
              color: kPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(80)),
                  child: Container(
                    // height: MediaQuery.of(context).size.height - 185,
                    decoration: const BoxDecoration(
                      color: backgroundColor,
                    ),
                    child: ListView(
                        primary: false,
                        padding:
                            const EdgeInsets.only(top: 20, left: 25, right: 0),
                        children: List.generate(
                            13,
                            (index) => CustomerDetailList(
                                  index: index,
                                ))),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
