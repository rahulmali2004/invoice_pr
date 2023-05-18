import 'package:flutter/material.dart';
import 'package:invoice_pr/modals/MyRoutes.dart';
import 'package:invoice_pr/utils/product.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    int ind = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.FavouriteProductsPage);
            },
            icon: Icon(
              Icons.favorite_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(MyRoutes.CustomerInfoPage);
            },
            icon: Icon(
              Icons.picture_as_pdf,
            ),
          ),
        ],
        title: Text(
          "CART_PAGE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 15,
              child: ListView.builder(
                itemCount: addcart.length,
                itemBuilder: (BuildContext context, int index) => Column(
                  children: [
                    SizedBox(height: s.height * 0.01),
                    // const Spacer(),
                    Row(
                      children: [
                        // product Image
                        CircleAvatar(
                          foregroundImage:
                          NetworkImage(addcart[index].thumbnail),
                        ),
                        SizedBox(
                          width: s.width * 0.05,
                        ),
                        // Product Title / Product Price
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // product Title
                            Text(addcart[index].title),
                            // Product Price
                            Text("\$ ${addcart[index].price}"),
                          ],
                        ),
                        const Spacer(),
                        // Product Quantities
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (addcart[index].quantity < 1) {
                                    addcart
                                        .remove(addcart[index]);
                                  } else {
                                    addcart[index].quantity--;
                                  }
                                });
                              },
                              icon: const Icon(Icons.remove_rounded),
                            ),
                            Text(
                                "${addcart[index].price * addcart[index].quantity}"),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  addcart[index].quantity++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child:
                ElevatedButton(onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.CustomerInfoPage);
                }, child: const Text("Buy")))
          ],
        ),
      ),
    );
  }
}
