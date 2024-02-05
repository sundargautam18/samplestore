import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<List<CartItem>> {
  List<CartItem> cartItems = [];

  CartCubit() : super([]); // Initialize with an empty list

  void addToCart(CartItem item) {
    final existingItemIndex =
        cartItems.indexWhere((element) => element.name == item.name);

    if (existingItemIndex != -1) {
      // If the item already exists, update its quantity
      cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      // If it's a new item, add it to the list
      cartItems.add(item);
    }

    emit(List.from(cartItems)); // Emit a new instance of cartItems list
  }

  void removeFromCart(CartItem item) {
    cartItems.removeWhere((element) => element.name == item.name);
    emit(List.from(cartItems)); // Emit a new instance of cartItems list
  }

  void updateQuantity(CartItem item, int newQuantity) {
    final index = cartItems.indexWhere((element) => element.name == item.name);
    if (index != -1) {
      cartItems[index].quantity = newQuantity;
      emit(List.from(cartItems)); // Emit a new instance of cartItems list
    }
  }

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}