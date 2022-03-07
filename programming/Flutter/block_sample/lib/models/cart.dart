import 'package:block_sample/models/product.dart';

class Cart{
  Product product=Product(0, "", 0);
  int quantity=0;

  Cart(this.product,this.quantity);
}