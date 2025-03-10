import 'package:flutter/material.dart';
import '../../domain/entities/dish.dart';
import 'package:get/get.dart';

import '../screens/dish_detail_page.dart';


class DishCard extends StatelessWidget {
  final Dish dish;

  const DishCard({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DishDetailsPage(dish: dish),
          transition: Transition.fadeIn, // Smooth transition
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.network(dish.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
          title: Text(dish.name),
          subtitle: Text('\$${dish.price.toStringAsFixed(2)}'),
        ),
      ),
    );
  }
}
