class Dish {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String description;
  final List<String>? ingredients;

  const Dish({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    this.ingredients,
  });
}
