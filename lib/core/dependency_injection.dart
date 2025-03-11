import 'package:get/get.dart';
import 'package:restaurant_menu/data/repositories/menu_repository.dart';
import 'package:restaurant_menu/domain/useCases/get_menu.dart';
import 'package:restaurant_menu/presentation/controller/cart_controller.dart';
import 'package:restaurant_menu/presentation/controller/favorite_controller.dart';
import 'package:restaurant_menu/presentation/controller/home_controller.dart';

class DependencyInjection {
  static void init() {
    // Initialize repositories
    final menuRepository = MenuRepository();

    // Initialize use cases
    final getMenuUseCase = GetMenuUseCase(menuRepository);

    // Initialize GetX Controllers and pass dependencies
    Get.put(HomeController(getMenuUseCase));
    Get.put(CartController());
    Get.put(FavoritesController());
  }
}
