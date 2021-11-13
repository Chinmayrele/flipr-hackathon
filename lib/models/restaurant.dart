class Restaurant {
  String id;
  String title;
  String imageUrl;
  String address;
  int minimumPrice;
  double latitude;
  double longitude;
  double rating;

  Restaurant(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.address,
      required this.minimumPrice,
      required this.latitude,
      required this.longitude,
      required this.rating});
}
