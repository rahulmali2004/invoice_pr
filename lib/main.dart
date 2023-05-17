import 'package:flutter/material.dart';
import 'package:invoice_pr/modals/product_modals.dart';
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
        MyRoutes.homepage: (context) =>
            Builder(
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
                    body: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          Row(
                            children: const [Text("E_COMMERCE")],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 550,
                            width: double.infinity,
                            child: GridView.builder(
                                gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2 / 3,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                ),
                                itemCount: products.length,
                                itemBuilder: (BuildContext context,
                                    int index) =>
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                product[index].thumbnail)),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.primaries[index % 18]
                                            .shade200,
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Column(
                                          children: [
                                            Spacer(),
                                            Text(
                                              product[index].title,
                                              style: const TextStyle(
                                                  fontSize: 10),
                                            ),
                                            Text(
                                              "${product[index].price}",
                                              style: const TextStyle(
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                      ),
                                    )),
                          ),
                        ],
                      ),
                    ),
                );
              },
            ),
      },
    );
  }
}
