import 'package:get/get.dart';
import 'package:restaurant_menu/data/repositories/menu_repositoryIml.dart';
class DependencyInjection {
  static void init() {

    Get.lazyPut(() => MenuRepositoryIml());
  }
}
