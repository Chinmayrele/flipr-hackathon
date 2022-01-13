import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'constants.dart';

const buttonTextStyle = TextStyle(
  fontSize: 18,
);

const restaurantNameStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
const restaurantAddrssStyle = TextStyle(fontSize: 18, color: Colors.white);
const dishNameStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kTextDarkColor);
const dishPriceStyle = TextStyle(fontSize: 16, color: kTextDarkColor);

const appTitleStyle = TextStyle(
    fontSize: 28, fontWeight: FontWeight.bold, color: backgroundColor);

const appTitleStyleDark =
    TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: kTextDarkColor);
const appDescriptionStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

const headerTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

const titleTextStyle =
    TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16);

const addressTextStyle = TextStyle(color: Colors.black, fontSize: 10);

final priceRatingTextStyle = TextStyle(
    color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold);

const headertitleTextStyle = TextStyle(
    color: backgroundColor, fontWeight: FontWeight.bold, fontSize: 18);

const headeraddressTextStyle = TextStyle(color: backgroundColor, fontSize: 16);

final appTheme = ThemeData(
    fontFamily: "Poppins",
    primaryColor: kPrimaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kPrimaryColor,
    ));
