part of 'cart_cubit.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;
  CartItem({required this.name, required this.price, required this.quantity});
  get getName => name;

  set setName(name) => name = name;

  get getPrice => price;

  set setPrice(price) => price = price;

  get getQuantity => quantity;

  set setQuantity(quantity) => quantity = quantity;
}

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {
  CartLoading();
}

class CartSucess extends CartState {
  final List<CartItem> cartItem;
  CartSucess(this.cartItem);
}

class CartError extends CartState {
  final String errorMessage;
  CartError(this.errorMessage);
}
