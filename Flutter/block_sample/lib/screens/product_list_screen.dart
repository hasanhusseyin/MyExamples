import 'package:block_sample/blocks/product_bloc.dart';
import 'package:block_sample/models/cart.dart';
import 'package:flutter/material.dart';

import '../blocks/cart_bloc.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş"),
        actions: [
          IconButton(
              onPressed: () => {Navigator.pushNamed(context, "/cart")},
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: buildProductList(),
    );
  }

  Widget buildProductList() {

    return StreamBuilder(
        initialData: productBloc.getAll(),
        stream: productBloc.getStream,
        builder: (context, snapshot)  {
          if (snapshot.hasData) {
            return buildProductListItems(snapshot);
          } else {
            return Center(child: Text("Veri Yok"));
          }
        });
  }

  buildProductListItems(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, index) {
          var list = snapshot.data;
          return ListTile(
            title: Text(list[index].name),
            subtitle: Text(
              list[index].price.toString(),
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                cartBloc.addToCart(Cart(list[index], 1));
              },
            ),
          );
        });
  }
}
