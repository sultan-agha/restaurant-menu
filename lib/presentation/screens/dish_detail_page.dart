import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/dish.dart';
import '../controller/cart_controller.dart';
import '../controller/favorite_controller.dart';

class DishDetailsPage extends StatelessWidget {
  final Dish dish;
  final CartController cartController = Get.find<CartController>();
  final FavoritesController favoritesController = Get.find<FavoritesController>();

  DishDetailsPage({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dish.name),
        centerTitle: true,
        actions: [
          Obx(() {
            return IconButton(
              onPressed: () {
                favoritesController.toggleFavorite(dish);
              },
              icon: Icon(favoritesController.isFavorite(dish) ?
              Icons.favorite : Icons.favorite_border),
              color: favoritesController.isFavorite(dish) ?
              Colors.red : Colors.blue,
            );
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: dish.id, // Smooth animation from HomePage
            child: Image.network(dish.imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dish.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(
                  dish.ingredients!.join(", "), // Convert list to a single string
                  style: const TextStyle(fontSize: 17,),
                ),
                Text(dish.description, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 8),
                Text("\$${dish.price.toStringAsFixed(2)}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      cartController.addToCart(dish);
                      Get.snackbar("Added to Cart", "${dish.name} added successfully!");
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Add to Cart"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
