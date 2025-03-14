import 'package:get/get.dart';
import 'package:restaurant_menu/domain/useCases/get_menu.dart';
import 'package:restaurant_menu/presentation/controller/cart/cart_controller.dart';
import 'package:restaurant_menu/presentation/controller/favorite/favorite_controller.dart';

import '../../../data/repositories/menu_repositoryIml.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    //note when u need to cal an actual api use the menuRepositoryImpl
    Get.lazyPut(() => GetMenuUseCase(Get.find<MenuRepositoryIml>()));
    Get.put(HomeController(Get.find()), permanent: true);
    Get.put(FavoritesController());
    Get.put(CartController());
  }
}