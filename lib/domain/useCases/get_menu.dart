import 'package:restaurant_menu/data/models/dish_model.dart';

import '../../data/repositories/menu_repository.dart';
import '../entities/dish.dart';

class GetMenuUseCase {
  final MenuRepository repository;

  GetMenuUseCase(this.repository);

  Future<List<DishModel>> call() async {
    return await repository.fetchMenu();
  }
}
