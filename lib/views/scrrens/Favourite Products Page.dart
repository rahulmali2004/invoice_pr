import 'package:flutter/material.dart';

import '../../modals/MyRoutes.dart';
import '../../utils/product.dart';

class FavouriteProductsPage extends StatefulWidget {
  const FavouriteProductsPage({Key? key}) : super(key: key);

  @override
  State<FavouriteProductsPage> createState() => _FavouriteProductsPageState();
}

class _FavouriteProductsPageState extends State<FavouriteProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          "FAVOURITE_PRODUCTS",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: favourite.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  MyRoutes.ProductDetailPage,
                  arguments: index,
                );
              },
              leading: CircleAvatar(
                foregroundImage: NetworkImage(
                  favourite[index].thumbnail,
                ),
              ),
              title: Text(
                "${favourite[index].title}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              trailing: Text(
                "\$ ${favourite[index].price}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
