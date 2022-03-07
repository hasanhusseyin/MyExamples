import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);
  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(children: [
          Container(
            child: Image.network(
                "https://cdn.pixabay.com/photo/2020/04/14/18/13/honey-5043708_960_720.jpg"),
            height: MediaQuery.of(context).size.height/7,
            width: MediaQuery.of(context).size.width / 2,
          ),
          Text(product.productName),
          Text(product.unitPrice.toString() + " ₺",
              style: TextStyle(fontSize: 18, color: Colors.blueGrey))
        ]),
      ),
    );
  }
}
