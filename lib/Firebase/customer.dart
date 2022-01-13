import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:zomato_hackathon/common/location_handler.dart';
import 'package:zomato_hackathon/models/dish.dart';
import 'package:zomato_hackathon/models/orders.dart';
import 'package:zomato_hackathon/models/restaurant.dart';

List<Restaurant> allrestaurents = [];
List<Orders> allOrders = [];

Future<void> getRestaurantsForClient() async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = await databaseRef.child("Restaurants").get();
    newRef.value.forEach((key, value) {
      List<Dish> dishes = [];

      value["dishes"]
          .forEach((key, value) => dishes.add(Dish.fromJson(key, value)));
      print(dishes);
      final restaurant = Restaurant(
          id: key,
          title: value["title"],
          imageUrl: value["imageUrl"],
          address: value["address"],
          minimumPrice: value["minimumPrice"],
          latitude: value["latitude"],
          longitude: value["longitude"],
          alldishes: dishes,
          rating: value["rating"] ?? 0.0);

      allrestaurents.add(restaurant);
    });
  } catch (err) {
    print(err.toString());
    throw err;
  }
}

Future<void> placeOrders(String restaurantId, List<dynamic> orders) async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = databaseRef
        .child("Users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child("orders")
        .push();
    await newRef.set({"accepted": false, "rejected": true, "detail": orders});
    await databaseRef
        .child("Restaurants")
        .child(restaurantId)
        .child("orders")
        .child(newRef.key)
        .set({
      "address":
          "${LocationHandler.locationCoordinates.longitude}||${LocationHandler.locationCoordinates.longitude}",
      "detail": orders,
      "email": FirebaseAuth.instance.currentUser!.email,
      "user_id": FirebaseAuth.instance.currentUser!.uid,
      "order_id": newRef.key
    });
  } catch (err) {
    throw err;
  }
}

Future<void> fetchOrders() async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = await databaseRef
        .child("Users")
        .child(FirebaseAuth.instance.currentUser!.uid)
        .child("orders")
        .get();
    newRef.value.forEach((key, value) {
      final order = Orders(
          id: key,
          items: [],
          accepted: value["accepted"],
          rejected: value["rejected"]);
      allOrders.add(order);
    });
  } catch (err) {
    throw err;
  }
}
