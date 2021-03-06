// ignore_for_file: unnecessary_null_comparison

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zomato_hackathon/constants.dart';

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({required this.imagePickerFn, required this.title});

  final void Function(File pickedImage) imagePickerFn;
  final String title;

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  late File _pickedImage;
  bool picked = false;
  void _pickImage() async {
    final image = ImagePicker();
    final imageFile = await image.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = File(imageFile!.path);
    });
    setState(() {
      picked = true;
    });
    widget.imagePickerFn(File(imageFile!.path));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (picked)
            ? CircleAvatar(radius: 80, backgroundImage: FileImage(_pickedImage))
            : const CircleAvatar(
                radius: 80, backgroundImage: NetworkImage(imagePlaceholder)),
        TextButton.icon(
          onPressed: () {
            _pickImage();
          },
          icon: const Icon(
            Icons.image,
            color: kPrimaryColor,
          ),
          label: Text(
            widget.title,
            style: const TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
