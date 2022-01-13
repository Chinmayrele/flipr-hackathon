class Orders {
  String id;
  List<OrderedDish> items;
  bool accepted;
  bool rejected;

  Orders(
      {required this.id,
      required this.items,
      required this.accepted,
      required this.rejected});
}

class OrderedDish {
  String id;
  String title;
  int price;
  int quantity;

  OrderedDish(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity});
}
