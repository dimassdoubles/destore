import 'package:destore/models/product.dart';
import 'package:flutter/cupertino.dart';

class Transaction extends ChangeNotifier {
  Product product;
  int quantity;

  Transaction({required this.product, this.quantity = 1});

  void addQuantity() {
    quantity++;
    notifyListeners();
  }

  void substractProductQuantity() {
    if (quantity > 0) {
      quantity--;
    }
    notifyListeners();
  }
}
