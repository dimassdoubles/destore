import 'package:destore/models/product.dart';
import 'package:destore/models/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionProvider extends ChangeNotifier {
  final List<Transaction> _allTransactions = [
    // Transaction(
    //   product: Product(
    //     id: 0,
    //     name: "Bakso",
    //     price: 12000,
    //     ordered: true,
    //     imageURL:
    //         "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    //   ),
    // ),
  ];

  int _total = 0;

  List<Transaction> get allTransactions {
    return [..._allTransactions];
  }

  int get total {
    return _total;
  }

  void insert(Product product) {
    if (product.ordered == false) {
      product.order();
      final transaction = Transaction(product: product);
      _allTransactions.insert(0, transaction);
      addTotal(product.price);
      notifyListeners();
    } else {
      Transaction? selectedTransaction = getTransaction(product);
      if (selectedTransaction != null) {
        // selectedTransaction.addQuantity();
        addProductQuantity(selectedTransaction);
        notifyListeners();
      }
    }
  }

  void substractProductQuantity(Transaction transaction) {
    if (transaction.quantity == 1) {
      _allTransactions.remove(transaction);
      transaction.product.unOrdered();
    } else {
      transaction.substractProductQuantity();
    }
    substractTotal(transaction.product.price);
    print("Hai");
    notifyListeners();
  }

  void addProductQuantity(Transaction transaction) {
    transaction.addQuantity();
    addTotal(transaction.product.price);
    print("Hello");
    notifyListeners();
  }

  void addTotal(int amount) {
    _total += amount;
    notifyListeners();
  }

  void substractTotal(int amount) {
    _total -= amount;
    notifyListeners();
  }

  Transaction? getTransaction(Product product) {
    for (final transaction in _allTransactions) {
      if (transaction.product == product) {
        print("ketemu produk");
        return transaction;
      }
    }
    return null;
  }
}
