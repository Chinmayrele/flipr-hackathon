import 'package:flutter/material.dart';
import 'package:zomato_hackathon/constants.dart';

class CustomerDetailList extends StatefulWidget {
  final int index;
  const CustomerDetailList({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomerDetailList> createState() => _CustomerDetailListState();
}

bool isOrdered = false;

class _CustomerDetailListState extends State<CustomerDetailList> {
  int quantity = 0;
  _addQuantity() {
    quantity++;
    setState(() {
      isOrdered = true;
    });
  }

  _subtractQuantity() {
    if (quantity == 0) {
      setState(() {
        isOrdered = false;
      });
      null;
    } else {
      quantity--;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: lightBlue,
                image: const DecorationImage(
                    image: AssetImage('assets/fonts/food.jpg'),
                    fit: BoxFit.cover),
              )),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/fonts/veg-symb.png'),
                  ),
                  const SizedBox(width: 3),
                  const Text(
                    'Panner Tikka',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '•\u20B9 250',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text('•43 min',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      )),
                  const SizedBox(width: 5),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            height: 40,
            width: 104,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [
                  lightBlue.withOpacity(0.8),
                  Colors.indigo.withOpacity(0.9)
                ], begin: Alignment.centerRight, end: Alignment.centerLeft)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _subtractQuantity();
                      });
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 20,
                    )),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    quantity.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                // const Spacer(),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _addQuantity();
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
