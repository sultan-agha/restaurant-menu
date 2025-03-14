import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu/presentation/screens/cart.dart';

import '../../domain/entities/dish.dart';
import '../controller/home/home_controller.dart';
import '../widgets/category_filter.dart';
import '../widgets/dish_card.dart';
import '../widgets/search_bar.dart';


class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.to(() => const CartPage(),
              transition: Transition.fadeIn, // Smooth transition
            );
          },
          icon: const Icon(Icons.shopping_cart, color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          SearchBarWidget(),
          const SizedBox(height: 10,),
          CategoryFilter(), // Add this above the list
          Expanded(
            child: Obx(() {
              var dishes = controller.searchText.isEmpty
                  ? controller.filteredMenu
                  : controller.searchedMenu;

              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (dishes.isEmpty) {
                return const Center(child: Text('No matching dishes found.'));
              }

              return AnimatedList(
                key: controller.listKey,
                initialItemCount: dishes.length,
                itemBuilder: (context, index, animation) {
                  return _buildAnimatedDish(dishes[index], animation);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
  Widget _buildAnimatedDish(Dish dish, Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0), // Start off-screen (right side)
        end: Offset.zero, // Move into position
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: DishCard(dish: dish),
      ),
    );
  }

}
