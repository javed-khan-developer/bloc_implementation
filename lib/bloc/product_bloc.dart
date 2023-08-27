import 'package:bloc/bloc.dart';
import 'package:bloc_implementation/models/product_model.dart';
import 'package:bloc_implementation/repository/product_repository.dart';
import 'package:equatable/equatable.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductLoadedEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc(this.productRepository) : super(ProductLoadingState()) {
    on<ProductLoadedEvent>((event, emit) async {
      try {
        emit(ProductLoadingState());
        var data = await productRepository.getProducts();
        emit(ProductLoadedState(productModel: data));
      } catch (e) {
        emit(ProductErrorState(errorMessage: e.toString()));
      }
    });
  }
}
