import 'package:get/get.dart';
import '../../domain/entities/dish.dart';
import 'package:get_storage/get_storage.dart';

import 'home_controller.dart';

class FavoritesController extends GetxController {
  var favorites = <Dish>[].obs;
  final _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void toggleFavorite(Dish dish) {
    if (favorites.contains(dish)) {
      favorites.remove(dish);
    } else {
      favorites.add(dish);
    }
    saveFavorites();
  }

  bool isFavorite(Dish dish) {
    return favorites.contains(dish);
  }

  void saveFavorites() {
    _storage.write('favorites', favorites.map((dish) => dish.id).toList());
  }

  void loadFavorites() {
    List<String>? savedFavorites = _storage.read<List<String>>('favorites');
    if (savedFavorites != null) {
      favorites.assignAll(
          savedFavorites.map((id) => Get.find<HomeController>().menu.firstWhere((dish) => dish.id == id))
      );
    }
  }
}
