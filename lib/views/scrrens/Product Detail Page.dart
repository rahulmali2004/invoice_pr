import 'package:flutter/material.dart';
import 'package:invoice_pr/modals/MyRoutes.dart';
import 'package:invoice_pr/utils/product.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final List<String> imagePaths = [];

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    Size s = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        MyRoutes.FavouriteProductsPage,
                        arguments: index);
                  },
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.red.shade200,
                    size: s.height * 0.035,
                  ),
                ),
                SizedBox(width: s.width * 0.001),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                        MyRoutes.CartPage,
                        arguments: index);
                  },
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    size: s.height * 0.035,
                  ),
                ),
              ],
            ),
          ],
          title: Text(
            "PRODUCT_DETAIL_PAGE",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: s.height * 0.1),
              // product Preview
              Stack(
                children: [
                  Container(
                    height: s.height * 0.5,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // product Preview
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                        crossAxisCount: 1,
                      ),
                      itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                        height: s.height * 0.02,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: s.height * 0.2,
                            child: Row(
                              children: [
                                Image.network(products[index]['images'][0]),
                                Image.network(products[index]['images'][1]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(320, 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.FavouriteProductsPage, arguments: index);
                        },
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          size: s.height * 0.05,
                          color: Colors.redAccent,
                        ),
                      )),
                ],
              ),
              SizedBox(height: s.height * 0.01),
              // Price & Add To cart
              Container(
                height: s.height * 0.11,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  // color: Colors.red
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$ ${product[index].price}",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            addcartproduct.add(product[index]);
                            Navigator.of(context)
                                .pushNamed(MyRoutes.FavouriteProductsPage, arguments: index);
                          },
                          icon:
                          Icon(Icons.favorite_border, size: s.height * 0.04),
                        ),
                        IconButton(
                          onPressed: () {
                            addcartproduct.add(product[index]);
                            Navigator.of(context).pushNamed(
                                MyRoutes.CartPage,
                                arguments: index);
                          },
                          icon: Icon(Icons.shopping_cart_outlined,
                              size: s.height * 0.04),
                        ),
                      ],
                    ),
                    Text(product[index].title, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              // Description
              Text(product[index].descprition, style: TextStyle(fontSize: 18)),
              SizedBox(
                height: s.height * 0.02,
              ),
            ],
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed(MyRoutes.CartPage, arguments: index);
          },
          child: const Icon(Icons.add_shopping_cart_outlined),
        ),
    );
  }
}
