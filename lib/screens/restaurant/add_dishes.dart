import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zomato_hackathon/Firebase/restaurant.dart';
import 'package:zomato_hackathon/common/buttons.dart';
import 'package:zomato_hackathon/common/image_picker.dart';

import '../../constants.dart';

class AddDishScreen extends StatefulWidget {
  const AddDishScreen({Key? key}) : super(key: key);

  @override
  _AddDishScreenState createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  late final imageUrl;
  var longitude = 0.0;
  var latitude = 0.0;
  late File _pickedImage;

  bool loading = false;

  submitForm() async {
    try {
      if (_titleController.text.isEmpty || _priceController.text.isEmpty) {
        return;
      }
      setState(() {
        loading = true;
      });
      // imageUrl = await uploadImage(_pickedImage.path);
      Map<String, dynamic> newDish = {
        "title": _titleController.text,
        "price": int.parse(_priceController.text),
        "imageUrl": "",
        "isAvaliable": true
      };

      await addDish(newDish);
      print("Added");
    } catch (err) {
      print(err.toString());
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Dish"),
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
              title: "Select Dish Image"),
          _buildTextField(_titleController, "Name"),
          _buildTextField(_priceController, "Price"),
          CustomButton(
              title: const Text("Add Dish"),
              onTap: submitForm,
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
