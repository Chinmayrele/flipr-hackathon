import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo({required BuildContext context, required Widget page}) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}

void replaceNavigateTo({required BuildContext context, required Widget page}) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => page));
}
