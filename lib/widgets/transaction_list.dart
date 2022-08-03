// ignore_for_file: unused_local_variable

import 'package:destore/providers/transaction_provider.dart';
import 'package:destore/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final allTransactions = transactionProvider.allTransactions;

    // return ListView(
    //   children: [
    //     TransactionItem(
    //       product: "Burger",
    //     ),
    //     TransactionItem(
    //       product: "Mie Ayam",
    //     ),
    //     TransactionItem(
    //       product: "Bakso",
    //     ),
    //     TransactionItem(
    //       product: "Es Teh",
    //     ),
    //     TransactionItem(
    //       product: "Ayam Goreng",
    //     ),
    //     TransactionItem(
    //       product: "Seblak",
    //     ),
    //     TransactionItem(
    //       product: "Ayam Bakar",
    //     ),
    //   ],
    // );

    return ListView.builder(
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: allTransactions[index],
        child: TransactionItem(),
      ),
      itemCount: allTransactions.length,
    );
  }
}
