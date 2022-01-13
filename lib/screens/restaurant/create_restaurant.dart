import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/image_picker.dart';
import 'package:zomato_hackathon/common/location_handler.dart';
import 'package:zomato_hackathon/common/navigate.dart';
import 'package:zomato_hackathon/common/progress_indicator.dart';
import 'package:zomato_hackathon/constants.dart';
import 'package:zomato_hackathon/screens/restaurant/restaurant_dashborad.dart';

class CreateRestaurant extends StatefulWidget {
  const CreateRestaurant({Key? key}) : super(key: key);

  @override
  _CreateRestaurantState createState() => _CreateRestaurantState();
}

class _CreateRestaurantState extends State<CreateRestaurant> {
  final _titleController = TextEditingController();
  final _minimumPriceController = TextEditingController();
  final _addressPriceController = TextEditingController();
  var longitude = 0.0;
  var latitude = 0.0;
  bool loading = false;
  late File _pickedImage;

  submitForm() async {
    if (_titleController.text.isEmpty ||
        _minimumPriceController.text.isEmpty ||
        _addressPriceController.text.isEmpty) {
      return;
    }
    try {
      setState(() {
        loading = true;
      });
      final imageUrl = await uploadImage(_pickedImage.path);
      Map<String, dynamic> restaurant = {
        "title": _titleController.text,
        "address": _addressPriceController.text,
        "minimumPrice": int.parse(_minimumPriceController.text),
        "longitude": longitude,
        "latitude": latitude,
        "email": FirebaseAuth.instance.currentUser!.email,
        "imageUrl": imageUrl
      };
      await createRestaurent(restaurant);
      setState(() {
        loading = true;
      });
      replaceNavigateTo(context: context, page: const RestaurantDashboard());
    } catch (e) {
      setState(() {
        loading = false;
      });
      print(e.toString());
    }
  }

  getLocation() async {
    final pos = await LocationHandler.getLocation();
    longitude = pos.longitude;
    latitude = pos.latitude;
    setState(() {});
  }

  @override
  void initState() {
    LocationHandler.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Restaurant"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomImagePicker(
              imagePickerFn: (pickedImage) => setState(() {
                    _pickedImage = pickedImage;
                  }),
              title: "Select Restaurant Image"),
          _buildTextField(_titleController, "Name"),
          _buildTextField(_minimumPriceController, "Minimum Order Price"),
          _buildTextField(_addressPriceController, "Text Address"),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Longitude: $longitude \nLatitude: $latitude"),
                Expanded(
                  child: CustomButton(
                      // width: size.width * 0.5,
                      title: const Text("Current Address"),
                      onTap: () => getLocation(),
                      buttonType: ButtonType.outlined),
                ),
              ],
            ),
          ),
          CustomButton(
              title: (loading)
                  ? progressIndicator()
                  : const Text("Create Restaurant"),
              onTap: () {
                if (!loading) {
                  submitForm();
                }
              },
              buttonType: ButtonType.text)
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {bool passwordField = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: passwordField,
        controller: controller,
        decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: kPrimaryColor))),
      ),
    );
  }
}
