import 'package:bloc_implementation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_detail_view.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is ProductLoadedState) {
            return ListView.builder(
              itemCount: state.productModel.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                              product: state.productModel[index]),
                        ));
                  },
                  child: ListTile(
                    leading:
                        Text(state.productModel[index].category.toString()),
                    trailing: Image.network(
                        state.productModel[index].image.toString()),
                    subtitle: Text(
                        state.productModel[index].rating?.rate.toString() ??
                            "NA"),
                  ),
                );
              },
            );
          } else if (state is ProductErrorState) {
            return Text(state.errorMessage);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
