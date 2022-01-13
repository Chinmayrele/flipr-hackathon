import 'package:flutter/material.dart';
import 'package:zomato_hackathon/screens/restaurant/widgets/orders_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Orders"),
        ),
        body: ListView(children: const [
          OrderWidget()
        ],));
  }
}
