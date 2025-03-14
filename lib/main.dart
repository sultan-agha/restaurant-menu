import 'package:flutter/material.dart';
import 'package:restaurant_menu/presentation/controller/home/home-binding.dart';
import 'package:restaurant_menu/presentation/screens/home.dart';
import 'package:get/get.dart';
import 'package:restaurant_menu/core/dependency_injection.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependencies
  DependencyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialBinding: HomeBinding(),
        initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const HomePage()
    );
  }
}

