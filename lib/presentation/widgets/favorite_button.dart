import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/dish.dart';
import '../controller/favorite_controller.dart';

class FavoriteButton extends StatelessWidget {
  final Dish dish;
  final FavoritesController controller = Get.find<FavoritesController>();

  FavoriteButton({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isFav = controller.isFavorite(dish);
      return IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : Colors.grey),
        onPressed: () => controller.toggleFavorite(dish),
      );
    });
  }
}
