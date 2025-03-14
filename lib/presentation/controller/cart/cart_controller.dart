import 'package:get/get.dart';
import '../../../domain/entities/dish.dart';

class CartController extends GetxController {
  var cartItems = <Dish, int>{}.obs;

  void addToCart(Dish dish) {
    cartItems.update(dish, (value) => value + 1, ifAbsent: () => 1);
  }

  void removeFromCart(Dish dish) {
    if (cartItems.containsKey(dish) && cartItems[dish]! > 1) {
      cartItems[dish] = cartItems[dish]! - 1;
    } else {
      cartItems.remove(dish);
    }
  }

  double get totalPrice {
    return cartItems.entries.fold(0, (sum, item) => sum + (item.key.price * item.value));
  }
}
