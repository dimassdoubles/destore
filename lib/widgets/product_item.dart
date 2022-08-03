import 'package:destore/models/product.dart';
import 'package:destore/providers/transaction_provider.dart';
import 'package:destore/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return InkWell(
      onTap: () {
        transactionProvider.insert(productData);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: borderRadius25,
              boxShadow: [
                dropShadow,
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: ClipRRect(
                    borderRadius: borderRadius25,
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      productData.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        productData.name,
                        style: monText(
                          14,
                          secondaryColor,
                          FontWeight.bold,
                        ),
                      ),
                      Text('Rp ${productData.price}',
                          style: laText(
                            14,
                            tertiaryColor,
                            FontWeight.w500,
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
