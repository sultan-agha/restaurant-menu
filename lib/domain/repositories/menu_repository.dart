
import '../../data/models/dish_model.dart';

abstract class MenuRepository {
  Future<List<DishModel>>getMenuItems();
}