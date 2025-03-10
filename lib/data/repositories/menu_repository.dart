import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/dish_model.dart';


class MenuRepository {
  Future<List<DishModel>> fetchMenu() async {
    final String response = await rootBundle.loadString('assets/menu.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => DishModel.fromJson(json)).toList();
  }
}
