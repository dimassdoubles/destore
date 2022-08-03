import 'package:destore/providers/product_provider.dart';
import 'package:destore/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final allProducts = productProvider.allProducts;

    return GridView.builder(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.8,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: allProducts[index],
        child: ProductItem(),
      ),
      itemCount: allProducts.length,
    );
  }
}
