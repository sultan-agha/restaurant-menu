import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu/presentation/screens/cart.dart';

import '../controller/home_controller.dart';
import '../widgets/category_filter.dart';
import '../widgets/dish_card.dart';
import '../widgets/search_bar.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Menu'),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.to(() => CartPage(),
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
              return ListView.builder(
                itemCount: dishes.length,
                itemBuilder: (context, index) {
                  return DishCard(dish: dishes[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
