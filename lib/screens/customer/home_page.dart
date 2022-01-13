import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/customer.dart';
import 'package:zomato_hackathon/common/location_handler.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/customer/widgets/app_drawer.dart';
import 'package:zomato_hackathon/screens/customer/widgets/home_list.dart';
import 'package:zomato_hackathon/styles.dart';

class CustomerHomePage extends StatefulWidget {
  const CustomerHomePage({Key? key}) : super(key: key);

  @override
  State<CustomerHomePage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerHomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            EvaIcons.menu2,
            size: 32,
          ),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        title: const Text(
          kAppTitle,
          style: appDescriptionStyle,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Container(
            width: size.width,
            color: kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.location_on_rounded,
                  color: backgroundColor,
                  size: 30,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    LocationHandler.address,
                    style: headeraddressTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: kPrimaryColor,
              padding: const EdgeInsets.only(top: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80)),
                child: Container(
                  padding: const EdgeInsets.only(top: 30, right: 12, left: 12),
                  decoration: const BoxDecoration(
                    color: backgroundColor,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: ListView(
                      children: List.generate(
                          allrestaurents.length,
                          (index) => HomeList(
                                restaurant: allrestaurents[index],
                                index: index,
                              )),
                    ),
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
