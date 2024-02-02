part of "product_cubit.dart";

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {
  ProductLoading();
}

class ProductSucess extends ProductState {
  final List<Product> productList;
  ProductSucess(this.productList);
}

class ProductError extends ProductState {
  final String errorMessage;
  ProductError(this.errorMessage);
}
