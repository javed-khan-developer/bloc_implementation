part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class ProductLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
