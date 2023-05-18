class Product {
  final String title;
  final String descprition;
  final String brand;
  final String category;
  final String thumbnail;
  final int price;
  final int id;
   int quantity = 1;

  Product({
    required this.descprition,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.price,
    required this.id,
    required this.title,
    this.quantity = 1 ,
  });

  factory Product.fromMap({required Map data}) {
    return Product(
        descprition: data['description'],
        brand: data['brand'],
        category: data['category'],
        thumbnail: data['thumbnail'],
        price: data['price'],
        id: data['id'],
        title: data['title']);

  }
}

class Myvariable  {
  static String? name;
  static String? email;
  static int? mobile_no;

}