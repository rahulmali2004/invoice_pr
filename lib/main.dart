import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  CarouselController buttonCarouselController = CarouselController();
  final List<String> carouseimage = [
    "https://static.vecteezy.com/system/resources/previews/001/950/076/original/online-shopping-concept-smartphone-online-store-free-vector.jpg",
    "https://www.chic.ae/wp-content/uploads/Top-5-Online-Shopping-Website-in-Dubai-UAE-2022-1.jpg",
    "https://indian-retailer.s3.ap-south-1.amazonaws.com/s3fs-public/2022-07/parcel-paper-cartons-with-shopping-cart-logo-trolley-laptop-keyboard-min.jpg",
    "https://bmkltsly13vb.compat.objectstorage.ap-mumbai-1.oraclecloud.com/cdn.dailymirror.lk/assets/uploads/image_efc2441e66.jpg",
  ];

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
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyRoutes.FavouriteProductsPage);
                          },
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
                      IconButton(onPressed: (){
                        Navigator.of(context).pushNamed(MyRoutes.CartPage);
                      }, icon: Icon(Icons.shopping_cart)),
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
                      CarouselSlider(
                        options: CarouselOptions(),
                        items: carouseimage
                            .map((item) => Container(
                                  child: Center(
                                      child: Image.network(item,
                                          fit: BoxFit.cover, width: 1000)),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          child: Text(
                        "category",
                        textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                      )),
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
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 13,
                        child: (filter.isEmpty)
                            ? GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                itemCount: product.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        MyRoutes.ProductDetailPage,
                                        arguments: index);
                                  },
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
                                      Text("${product[index]!.price}"),
                                      // Text("${product[index]!.brand}"),
                                    ],
                                  ),
                                ),
                              )
                            : GridView(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                ),
                                children: List.generate(filterproduct.length,
                                    (index) {
                                  if (filterproduct[index]!.category ==
                                      filter) {
                                    return Column(
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
                                        Text("${product[index]!.price}"),
                                        // Text("${product[index]!.brand}"),
                                      ],
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
      },
    );
  }
}
