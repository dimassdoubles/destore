import 'package:destore/providers/product_provider.dart';
import 'package:destore/providers/transaction_provider.dart';
import 'package:destore/theme.dart';
import 'package:destore/widgets/product_grid.dart';
import 'package:destore/widgets/transaction_item.dart';
import 'package:destore/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Text helloWorld = Text('Hello World!');

    // final productData = Provider.of<ProductProvider>(context);
    // final products = productData.allProducts;

    final transactionProvider = Provider.of<TransactionProvider>(context);
    final total = transactionProvider.total;

    return Scaffold(
      key: _scaffoldkey,
      drawer: Drawer(),
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () =>
                              _scaffoldkey.currentState!.openDrawer(),
                        ),
                        Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                  'DESTORE',
                                  style: monText(
                                      24, secondaryColor, FontWeight.bold),
                                )),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: double.infinity,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: borderRadius25,
                                      boxShadow: [
                                        dropShadow,
                                      ],
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(top: 16, bottom: 32),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ActiveCategory(title: 'Makanan'),
                              Category(title: 'Minuman'),
                              Category(title: 'Snack'),
                              Category(title: 'Kopi'),
                              Category(title: 'Es Krim'),
                              Category(title: 'Mie'),
                              Category(title: 'Bakso'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    child: ProductGrid(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  dropShadow,
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 40,
                        child: Text('Pesanan',
                            style:
                                monText(24, secondaryColor, FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: borderRadius35,
                      boxShadow: [
                        dropShadow,
                      ],
                    ),
                    child: Text('Meja 14',
                        style: monText(14, Colors.white, FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: borderRadius35,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: TransactionList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: borderRadius35,
                        boxShadow: [
                          dropShadow,
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style:
                                  monText(14, Colors.white, FontWeight.w600)),
                          Text('Rp $total',
                              style:
                                  monText(14, Colors.white, FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class TransactionList extends StatelessWidget {
//   const TransactionList({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         TransactionItem(
//           product: "Burger",
//         ),
//         TransactionItem(
//           product: "Mie Ayam",
//         ),
//         TransactionItem(
//           product: "Bakso",
//         ),
//         TransactionItem(
//           product: "Es Teh",
//         ),
//         TransactionItem(
//           product: "Ayam Goreng",
//         ),
//         TransactionItem(
//           product: "Seblak",
//         ),
//         TransactionItem(
//           product: "Ayam Bakar",
//         ),
//       ],
//     );
//   }
// }

// class ProductItem extends StatelessWidget {
//   const ProductItem({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: borderRadius25,
//             boxShadow: [
//               dropShadow,
//             ],
//           ),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 2,
//               child: Container(
//                 width: double.infinity,
//                 height: double.infinity,
//                 decoration: BoxDecoration(
//                   borderRadius: borderRadius25,
//                   color: primaryColor,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Text(
//                       'Mie Ayam',
//                       style: monText(
//                         14,
//                         secondaryColor,
//                         FontWeight.bold,
//                       ),
//                     ),
//                     Text('Rp 20.000',
//                         style: laText(
//                           14,
//                           tertiaryColor,
//                           FontWeight.w500,
//                         )),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class TransactionItem extends StatelessWidget {
//   const TransactionItem({
//     Key? key,
//     required this.product,
//   }) : super(key: key);

//   final String product;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 5),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 product,
//                 style: monText(
//                   14,
//                   secondaryColor,
//                   FontWeight.w600,
//                 ),
//               ),
//               Text(
//                 'Rp 252.000',
//                 style: monText(
//                   14,
//                   secondaryColor,
//                   FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Row(
//             children: [
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     minimumSize: Size(20, 30),
//                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     alignment: Alignment.center),
//                 child: Text('-'),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 '24',
//                 style: monText(
//                   13,
//                   secondaryColor,
//                   FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               TextButton(
//                 onPressed: () {},
//                 style: TextButton.styleFrom(
//                     padding: EdgeInsets.zero,
//                     minimumSize: Size(20, 30),
//                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     alignment: Alignment.center),
//                 child: Text('+'),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Divider(color: secondaryColor),
//         ],
//       ),
//     );
//   }
// }

class ActiveCategory extends StatelessWidget {
  const ActiveCategory({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: borderRadius25,
          boxShadow: [
            dropShadow,
          ],
        ),
        child: Text(
          title,
          style: monText(14, Colors.white, FontWeight.w600),
        ),
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
    required String this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius25,
          boxShadow: [
            dropShadow,
          ],
        ),
        child: Text(
          title,
          style: monText(14, secondaryColor),
        ),
      ),
    );
  }
}
