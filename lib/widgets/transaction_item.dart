import 'package:destore/models/product.dart';
import 'package:destore/models/transaction.dart';
import 'package:destore/providers/transaction_provider.dart';
import 'package:destore/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<Transaction>(context);
    final product = transactionData.product;

    final transactionProvider = Provider.of<TransactionProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.name,
                style: monText(
                  14,
                  secondaryColor,
                  FontWeight.w600,
                ),
              ),
              Text(
                'Rp ${product.price * transactionData.quantity}',
                style: monText(
                  14,
                  secondaryColor,
                  FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  transactionProvider.substractProductQuantity(transactionData);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(20, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center),
                child: Text('-'),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '${transactionData.quantity}',
                style: monText(
                  13,
                  secondaryColor,
                  FontWeight.w600,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {
                  transactionProvider.addProductQuantity(transactionData);
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(20, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.center),
                child: Text('+'),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(color: secondaryColor),
        ],
      ),
    );
  }
}
