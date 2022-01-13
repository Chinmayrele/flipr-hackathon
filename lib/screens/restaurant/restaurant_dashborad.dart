import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/restaurant/add_dishes.dart';
import 'package:zomato_hackathon/screens/restaurant/create_restaurant.dart';
import 'package:zomato_hackathon/screens/restaurant/orders_screen.dart';
import 'package:zomato_hackathon/screens/restaurant/widgets/dish_tile.dart';
import 'package:zomato_hackathon/styles.dart';

class RestaurantDashboard extends StatefulWidget {
  const RestaurantDashboard({Key? key}) : super(key: key);

  @override
  _RestaurantDashboardState createState() => _RestaurantDashboardState();
}

class _RestaurantDashboardState extends State<RestaurantDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    getRestaurant();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {
                navigateTo(context: context, page: const CreateRestaurant());
              },
              icon: const Icon(Icons.edit_rounded),
              iconSize: 30,
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                navigateTo(context: context, page: const OrdersScreen());
              },
              icon: const Icon(Icons.list_rounded),
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
                                        currentRestaurant.imageUrl,
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
                                  currentRestaurant.title,
                                  style: restaurantNameStyle,
                                ),
                                Text(
                                  currentRestaurant.address,
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
                        const BorderRadius.only(topLeft: Radius.circular(120)),
                    child: Container(
                      // height: MediaQuery.of(context).size.height - 185,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                          primary: false,
                          padding: const EdgeInsets.only(
                              top: 20, left: 25, right: 0),
                          children: List.generate(
                              currentRestaurant.alldishes.length,
                              (index) => DishTile(
                                    dish: currentRestaurant.alldishes[index],
                                  ))),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: CustomButton(
            width: size.width * 0.4,
            title: const Text(
              "+ Add Dish",
              style: buttonTextStyle,
            ),
            onTap: () =>
                navigateTo(context: context, page: const AddDishScreen()),
            buttonType: ButtonType.text));
  }
}
