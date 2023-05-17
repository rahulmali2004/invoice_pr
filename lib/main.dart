import 'package:flutter/material.dart';
import 'package:invoice_pr/modals/product_modals.dart';
import 'package:invoice_pr/utils/product.dart';
import 'package:invoice_pr/utils/product.dart';
import 'package:invoice_pr/utils/product.dart';
import 'package:invoice_pr/utils/splashscrren.dart';
import 'package:invoice_pr/views/scrrens/Cart%20Page.dart';
import 'package:invoice_pr/views/scrrens/Customer%20Info%20Page.dart';
import 'package:invoice_pr/views/scrrens/Favourite%20Products%20Page.dart';
import 'package:invoice_pr/views/scrrens/Product%20Detail%20Page.dart';
import 'package:invoice_pr/views/scrrens/invoice%20Preview%20Page.dart';
import 'modals/MyRoutes.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGrid = false;
  bool isDark = false;
  String filter = "";
  List<Product?> filterproduct = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      initialRoute: MyRoutes.SplashScreenPage,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: {
        MyRoutes.SplashScreenPage: (context) => const splashscrren(),
        MyRoutes.ProductDetailPage: (context) => const ProductDetailPage(),
        MyRoutes.FavouriteProductsPage: (context) =>
            const FavouriteProductsPage(),
        MyRoutes.CartPage: (context) => const CartPage(),
        MyRoutes.CustomerInfoPage: (context) => const CustomerInfoPage(),
        MyRoutes.InvoicePreviewPage: (context) => const InvoicePreviewPage(),
        MyRoutes.homepage: (context) => Builder(
              builder: (context) {
                // Size s = MediaQuery.of(context).size;
                return Scaffold(
                  appBar: AppBar(
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: Text(
                            "♡",
                            style: TextStyle(fontSize: 20),
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                        },
                        icon: Icon(isDark
                            ? Icons.light_mode_outlined
                            : Icons.dark_mode_outlined),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                    title: const Text(
                      "HOMEPAGE",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.cyan,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: category
                                .map(
                                  (c) => ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        filter = c;
                                        filterproduct = product.map((e) {
                                          if (e.category == c) {
                                            return e;
                                          }
                                        }).toList();
                                        filterproduct.removeWhere(
                                            (element) => element == null);
                                      });
                                    },
                                    child: Text(c),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 13,
                        child: (filter.isEmpty)
                            ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: products.length,
                                itemBuilder: (context, index) => Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 140,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  product[index].thumbnail),
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Text(product[index].category),
                                    ],
                                  ),
                                ),
                              )
                            : GridView(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                children: List.generate(filterproduct.length,
                                    (index) {
                                  if (filterproduct[index]!.category ==
                                      category) {
                                    return Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 140,
                                            width: 170,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      filterproduct[index]!
                                                          .thumbnail),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          Text(filterproduct[index]!.category),
                                        ],
                                      ),
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                                // children: allProduct.map((element) {
                                //    else {
                                //     return Container();
                                //   }
                                // }).toList(),
                              ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.grey.shade200,
                );
              },
            ),
      },
    );
  }
}
