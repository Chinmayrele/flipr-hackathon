import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/models/dish.dart';
import 'package:zomato_hackathon/screens/restaurant/add_dishes.dart';

import '../../../styles.dart';

class DishTile extends StatefulWidget {
  DishTile({Key? key, required this.dish}) : super(key: key);
  final Dish dish;
  @override
  _DishTileState createState() => _DishTileState();
}

class _DishTileState extends State<DishTile> {
  bool _value = false;

  handleChange(bool value) async {
    toogleAvaliablity(dishId: widget.dish.id, value: value)
        .then((value) => setState(() {}))
        .catchError((err) => print(err.toString()));
  }

  removeItem() async {
    await deleteDish(widget.dish.id)
        .then((value) => setState(() {}))
        .catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _value = widget.dish.isAvaliable;
    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width - 25,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/6/62/Barbieri_-_ViaSophia25668.jpg"),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dish.title,
                  style: dishNameStyle,
                ),
                Text(
                  "₹ ${widget.dish.price}",
                  style: dishPriceStyle,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              CupertinoSwitch(value: _value, onChanged: handleChange),
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                      onTap: () => navigateTo(
                          context: context, page: const AddDishScreen()),
                      child: Row(
                        children: const [
                          Icon(Icons.edit),
                          SizedBox(
                            width: 4,
                          ),
                          Text("Edit Dish"),
                        ],
                      )),
                  PopupMenuItem(
                      onTap: removeItem,
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(
                            width: 4,
                          ),
                          Text("Remove Dish"),
                        ],
                      ))
                ],
                icon: const Icon(Icons.more_vert_rounded),
              )
            ],
          ),
        ],
      ),
    );
  }
}
