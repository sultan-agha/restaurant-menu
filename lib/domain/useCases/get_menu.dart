import 'package:restaurant_menu/core/useCases/no_param_usecase.dart';
import '../repositories/menu_repository.dart';

class GetMenuUseCase extends NoParamUseCase {
  final MenuRepository repository;

  GetMenuUseCase(this.repository);
  @override
  Future execute() {
    return  repository.getMenuItems();
  }
}
