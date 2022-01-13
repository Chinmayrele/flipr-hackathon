import 'package:flutter/material.dart';
import 'package:zomato_hackathon/constants.dart';

enum ButtonType { outlined, text }
enum ButtomShape { rounded, sharp }

class CustomButton extends StatelessWidget {
  final Widget title;
  final void Function() onTap;
  final ButtonType buttonType;
  final double width;
  final Color color;
  final EdgeInsets padding;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.buttonType,
      this.color = kPrimaryColor,
      this.padding = const EdgeInsets.all(8),
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: padding,
        child: OutlinedButton(
          onPressed: onTap,
          child: title,
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(16),
              side: BorderSide(color: color),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              primary: (buttonType == ButtonType.text) ? Colors.white : color,
              backgroundColor:
                  (buttonType == ButtonType.text) ? color : Colors.white),
        ),
      ),
    );
  }
}
