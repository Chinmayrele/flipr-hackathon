import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationHandler with ChangeNotifier {
  static final _geolocatorPlatform = GeolocatorPlatform.instance;
  static late Position locationCoordinates;
  static late String address;

  static init() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Please enable Location");
    }
    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      final status = await _geolocatorPlatform.requestPermission();
      if (status == LocationPermission.denied) {}
    }
    getLocation();
    print("Granted!!");
  }

  static getLocation() async {
    final position = await _geolocatorPlatform.getCurrentPosition();
    locationCoordinates = position;
    getCurrentAddress();
    return position;
  }

  static getCurrentAddress() async {
    final add = await placemarkFromCoordinates(
        locationCoordinates.latitude, locationCoordinates.longitude);
    address =
        "${add.first.thoroughfare} ${add.first.locality} Pincode: ${add.first.postalCode}";
    print(add.first.street);
  }
}
