import 'package:bloc_implementation/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductsModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Image.network(product.image.toString()),
            Text(product.description.toString())
          ],
        ),
      ),
    );
  }
}
