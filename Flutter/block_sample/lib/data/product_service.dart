import 'package:block_sample/models/product.dart';

class ProductService{
  static List<Product> products=<Product>[];

  static ProductService _singleton=ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll(){
    products.add(Product(1, "Laptop", 6000));
    products.add(Product(2, "Ekran", 6000));
    products.add(Product(3, "Kasa", 6000));
    return products;
  }
}