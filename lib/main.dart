import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_posts/app/routes/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Posts',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.deepPurpleAccent,
          secondary: Colors.deepOrangeAccent,
        ),
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
