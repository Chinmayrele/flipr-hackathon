import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:zomato_hackathon/models/dish.dart';
import 'package:zomato_hackathon/models/restaurant.dart';

late Restaurant currentRestaurant;

Future<String> uploadImage(String filePath) async {
  File file = File(filePath);
  final filename = filePath.split("/").last;
  try {
    await FirebaseStorage.instance.ref('iamges/$filename').putFile(file);
    return FirebaseStorage.instance.ref('images/$filename').getDownloadURL();
  } on FirebaseException catch (e) {
    throw e;
  }
}

Future<bool> getRestaurant() async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = await databaseRef.child("Restaurants").get();
    newRef.value.forEach((key, value) {
      if (value["email"] == FirebaseAuth.instance.currentUser!.email) {
        // print(value["dishes"]);
        List<Dish> dishes = [];

        value["dishes"]
            .forEach((key, value) => dishes.add(Dish.fromJson(key, value)));
        print(dishes);
        currentRestaurant = Restaurant(
            id: key,
            title: value["title"],
            imageUrl: value["imageUrl"],
            address: value["address"],
            minimumPrice: value["minimumPrice"],
            latitude: value["latitude"],
            longitude: value["longitude"],
            alldishes: dishes,
            rating: value["rating"] ?? 0.0);
        return true;
      }
    });
    return false;
  } catch (err) {
    print(err.toString());
    throw err;
  }
}

Future<void> createRestaurent(Map<String, dynamic> createdRestaurent) async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = databaseRef.child("Restaurants").push();
    await newRef.set(createdRestaurent);
    currentRestaurant = Restaurant(
        id: newRef.key,
        title: createdRestaurent["title"],
        imageUrl: createdRestaurent["imageUrl"],
        address: createdRestaurent["address"],
        minimumPrice: createdRestaurent["minimumPrice"],
        latitude: createdRestaurent["latitude"],
        longitude: createdRestaurent["longitude"],
        alldishes: [],
        rating: 0.0);
    return;
  } catch (err) {
    throw err;
  }
}

Future<void> addDish(Map<String, dynamic> newDish) async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = databaseRef
        .child("Restaurants")
        .child(currentRestaurant.id)
        .child("dishes")
        .push();
    // newRef.push();
    await newRef.set(newDish);
    final dish = Dish(
        id: newRef.key,
        title: newDish["title"],
        price: newDish["price"],
        isAvaliable: true);
    currentRestaurant.alldishes.add(dish);
    return;
  } catch (err) {
    print(err.toString());
    throw err;
  }
}

Future<void> toogleAvaliablity(
    {required String dishId, required bool value}) async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = databaseRef
        .child("Restaurants")
        .child(currentRestaurant.id)
        .child("dishes")
        .child(dishId)
        .update({"isAvaliable": value});
    int id = currentRestaurant.alldishes
        .indexWhere((element) => element.id == dishId);
    currentRestaurant.alldishes[id].isAvaliable = value;
    // newRef.push();isAvaliable
    return;
  } catch (err) {
    print(err.toString());
    throw err;
  }
}

Future<void> deleteDish(String dishId) async {
  try {
    final databaseRef = FirebaseDatabase.instance.reference();
    final newRef = databaseRef
        .child("Restaurants")
        .child(currentRestaurant.id)
        .child("dishes")
        .child(dishId)
        .remove();
    currentRestaurant.alldishes.removeWhere(
        (element) => element.id == dishId); // newRef.push();isAvaliable
    return;
  } catch (err) {
    print(err.toString());
    throw err;
  }
}

Future<void> handleOrders(
    {required String orderId, required bool accept}) async {}

Future<void> updateResturent(Restaurant updatedRestaurant) async {}

Future<void> updateDish(Dish updatedDish) async {}
