part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  const ProductsLoaded({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}
// class ProductLoaded extends ProductState {
//   final Product products;

//   const ProductLoaded({required this.products});

//   @override
//   List<Object> get props => [products];
// }
