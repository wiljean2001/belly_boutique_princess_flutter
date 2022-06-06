part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Product> products;

  const UpdateProducts(this.products);

  @override
  List<Object> get props => [products];
}


class AddProduct extends ProductEvent {
  final Product product;

  const AddProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class UpdateProduct extends ProductEvent {
  final Product product;

  const UpdateProduct({
    required this.product,
  });

  @override
  List<Object> get props => [product];
}

class UpdateProductImages extends ProductEvent {
  final Product? product;
  final List<XFile> image;

  const UpdateProductImages({
    this.product,
    required this.image,
  });

  @override
  List<Object> get props => [product!, image];
}
