import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu/data/models/dish_model.dart';
import '../../domain/entities/dish.dart';
import '../../domain/useCases/get_menu.dart';

class HomeController extends GetxController {
  final GetMenuUseCase getMenuUseCase;

  var menu = <DishModel>[].obs;
  var isLoading = true.obs;
  var selectedCategory = 'All'.obs;
  var searchText = ''.obs;
  var filteredMenu = <Dish>[].obs;
  var searchedMenu = <Dish>[].obs;


  final List<String> categories = ['All', 'Starters', 'Main Course', 'Desserts', 'Drinks'];

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();



  HomeController(this.getMenuUseCase);

  @override
  void onInit() {
    fetchMenu();
    super.onInit();
  }
  void fetchMenu() async {
    try {
      isLoading(true);
      menu.value = await getMenuUseCase();
      filteredMenu.assignAll(menu);
    } catch (e) {
      print("Error loading menu: $e");
    } finally {
      isLoading(false); // Ensure loading is turned off even if an error occurs
    }
  }

  void filterByCategory(String category) {
      selectedCategory.value = category;
    // Remove all items from AnimatedList first
    for (int i = filteredMenu.length - 1; i >= 0; i--) {
      listKey.currentState?.removeItem(
        i,
            (context, animation) => const SizedBox.shrink(), // Remove without animation
        duration: const Duration(milliseconds: 100),
      );
    }

    Future.delayed(const Duration(milliseconds: 120), () {
      filteredMenu.clear(); // Now it's safe to clear
          if (category == 'All') {
            filteredMenu.assignAll(menu);
          }else {
            filteredMenu.assignAll(
                menu.where((dish) => dish.category == category));
          }
      // Insert new items with animation
      for (int i = 0; i < filteredMenu.length; i++) {
        listKey.currentState?.insertItem(i);
      }
    });
  }
  void updateSearch(String query) {
    searchText.value = query;
    for (int i = searchedMenu.length - 1; i >= 0; i--) {
      listKey.currentState?.removeItem(
        i,
            (context, animation) => const SizedBox.shrink(), // Remove without animation
        duration: const Duration(milliseconds: 100),
      );
    }
    Future.delayed(const Duration(milliseconds: 120), () {
      searchedMenu.clear(); // Now it's safe to clear
      if (query.isEmpty) {
        searchedMenu.assignAll(filteredMenu); // Search within the filtered list, not full menu
      } else {
        searchedMenu.assignAll(
            filteredMenu.where((dish) => dish.name.toLowerCase().contains(query.toLowerCase()))
        );
      }
      // Insert new items with animation
      for (int i = 0; i < searchedMenu.length; i++) {
        listKey.currentState?.insertItem(i);
      }
    });
  }

}
