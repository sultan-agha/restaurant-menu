import 'package:get/get.dart';
import 'package:restaurant_menu/presentation/controller/cart/cart_controller.dart';



class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
  }
}