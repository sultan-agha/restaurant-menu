import 'package:flutter/material.dart';
import 'package:restaurant_menu/presentation/controller/cart_controller.dart';
import 'package:restaurant_menu/presentation/controller/favorite_controller.dart';
import 'package:restaurant_menu/presentation/controller/home_controller.dart';
import 'package:restaurant_menu/presentation/screens/home.dart';
import 'package:get/get.dart';

import 'data/repositories/menu_repository.dart';
import 'domain/useCases/get_menu.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependencies
  final menuRepository = MenuRepository();
  final getMenuUseCase = GetMenuUseCase(menuRepository);

  // Initialize GetX Controllers and pass dependencies
  Get.put(HomeController(getMenuUseCase));
  Get.put(CartController());
  Get.put(FavoritesController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: HomePage()
    );
  }
}

