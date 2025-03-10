
import '../../domain/entities/dish.dart';

class DishModel extends Dish {
  const DishModel({
    required String id,
    required String name,
    required String category,
    required double price,
    required String imageUrl,
    required String description,
    List<String>? ingredients,
  }) : super(
    id: id,
    name: name,
    category: category,
    price: price,
    imageUrl: imageUrl,
    description: description,
    ingredients: ingredients,
  );

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      price: json['price'].toDouble(),
      imageUrl: json['image'],
      description: json['description'],
      ingredients: List<String>.from(json['ingredients'] ?? []),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "price": price,
    "imageUrl": imageUrl,
    "description": description,
    "ingredients": ingredients,
  };
}
