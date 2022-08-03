import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  int id;
  String name;
  int price;
  String imageURL;
  bool ordered;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.imageURL,
      this.ordered = false});

  void order() {
    ordered = true;
    notifyListeners();
  }

  void unOrdered() {
    ordered = false;
    notifyListeners();
  }
}
