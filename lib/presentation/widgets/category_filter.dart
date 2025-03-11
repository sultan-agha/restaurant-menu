import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class CategoryFilter extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Categories:",style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20
          ),),
          DropdownButton<String>(
            value: controller.selectedCategory.value,
            items: controller.categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) controller.filterByCategory(value);
            },
          ),
        ],
      );
    });
  }

}
