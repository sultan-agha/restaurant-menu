import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:restaurant_menu/data/network-providers/api/menu-api.dart';
import 'package:restaurant_menu/domain/repositories/menu_repository.dart';

import '../models/dish_model.dart';


class MenuRepositoryIml extends MenuRepository{

  @override
  Future<List<DishModel>> getMenuItems() async {
    final String response = await rootBundle.loadString('assets/menu.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => DishModel.fromJson(json)).toList();
  }
}


//when we need to use api
//   class MenuRepositoryIml extends MenuRepository {
//   @override
//   Future<List<DishModel>> getMenuItems() async{
//   final response = await MenuAPI.getMenuItems().request();
//   final List<dynamic> data = json.decode(response);
//   return data.map((json) => DishModel.fromJson(response)).toList();
//   }
//}
