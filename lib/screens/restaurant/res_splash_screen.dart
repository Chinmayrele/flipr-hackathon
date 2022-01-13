import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/common/progress_indicator.dart';
import 'package:zomato_hackathon/screens/restaurant/ask_create_restaurant.dart';
import 'package:zomato_hackathon/screens/restaurant/restaurant_dashborad.dart';

class ResSplachScreen extends StatefulWidget {
  const ResSplachScreen({Key? key}) : super(key: key);

  @override
  _ResSplachScreenState createState() => _ResSplachScreenState();
}

class _ResSplachScreenState extends State<ResSplachScreen> {
  @override
  void initState() {
    getres();
    super.initState();
  }

  getres() async {
    getRestaurant().then((value) {
      print(value);
      if (value) {
        replaceNavigateTo(context: context, page: const RestaurantDashboard());
      } else {
        replaceNavigateTo(context: context, page: const AskCreateRestaurant());
      }
    }).catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: progressIndicator());
  }
}
