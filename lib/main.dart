import 'package:assignment_app/home_screen.dart';
import 'package:assignment_app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';


void main() async {
  await GetStorage.init();;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: box.read("isLoggedIn") == null ? LoginScreen() : HomeScreen(),
    );
  }
}