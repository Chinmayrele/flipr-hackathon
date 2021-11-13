import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/image_picker.dart';
import 'package:zomato_hackathon/constants.dart';

class CreateRestaurant extends StatefulWidget {
  const CreateRestaurant({Key? key}) : super(key: key);

  @override
  _CreateRestaurantState createState() => _CreateRestaurantState();
}

class _CreateRestaurantState extends State<CreateRestaurant> {
  final _titleController = TextEditingController();
  final _minimumPriceController = TextEditingController();
  final _addressPriceController = TextEditingController();
  late final imageUrl;
  late final longitude;
  late final latitude;
  late File _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Restaurant"),
      ),
      body: ListView(
        children: [
          CustomImagePicker(
              imagePickerFn: (pickedImage) => setState(() {
                    _pickedImage = pickedImage;
                  }),
              title: "Restaurant Image"),
          _buildTextField(_titleController, "Name"),
          _buildTextField(_minimumPriceController, "Minimum Order Price"),
          _buildTextField(_addressPriceController, "Text Address"),
          CustomButton(
              title: const Text("Current Address"),
              onTap: () => {},
              buttonType: ButtonType.text),
          CustomButton(
              title: const Text("Create Restaurant"),
              onTap: () => {},
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
