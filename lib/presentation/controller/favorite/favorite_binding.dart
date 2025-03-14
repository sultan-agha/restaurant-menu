import 'package:get/get.dart';
import 'package:restaurant_menu/presentation/controller/favorite/favorite_controller.dart';


class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController(), permanent: true);
  }
}