class Dish {
  String id;
  String title;
  int price;
  bool isAvaliable;

  Dish(
      {required this.id,
      required this.title,
      required this.price,
      required this.isAvaliable});

  static Dish fromJson(String key, dynamic value) {
    final dish = Dish(
        id: key,
        title: value['title'],
        price: value['price'],
        isAvaliable: value['isAvaliable']);
    print(key);
    return dish;
  }
}
