import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu/presentation/controller/home/home_controller.dart';

class SearchBarWidget extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) => controller.updateSearch(value),
        decoration: InputDecoration(
          hintText: 'Search dishes...',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
