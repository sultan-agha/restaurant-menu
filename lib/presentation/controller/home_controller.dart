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
      if (category == 'All') {
        filteredMenu.assignAll(menu);
      } else {
        filteredMenu.assignAll(menu.where((dish) => dish.category == category));
      }
  }


  void updateSearch(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      searchedMenu.assignAll(menu);
    } else {
      searchedMenu.assignAll(
          menu.where((dish) => dish.name.toLowerCase().contains(query.toLowerCase()))
      );
    }
  }
}
