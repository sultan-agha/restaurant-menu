import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/dish.dart';
import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {

  CartPage({super.key});

  final CartController controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'),
      centerTitle: true,
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) {
                  Dish dish = controller.cartItems.keys.toList()[index];
                  int quantity = controller.cartItems[dish]!;
                  return ListTile(
                    title: Text(dish.name),
                    subtitle: Text('\$${dish.price.toStringAsFixed(2)} x $quantity'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove,color: Colors.red),
                          onPressed: () => controller.removeFromCart(dish),
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: const Icon(Icons.add,color: Colors.red,),
                          onPressed: () => controller.addToCart(dish),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Total: \$${controller.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      }),
    );
  }
}
