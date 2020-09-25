import 'package:flutter/material.dart';
import 'package:flutterdemogetx/utils/di/dependencies_binding.dart';
import 'package:flutterdemogetx/view/detail/detail_binding.dart';
import 'package:flutterdemogetx/view/detail/detail_view.dart';
import 'package:flutterdemogetx/view/search/search_binding.dart';
import 'package:flutterdemogetx/view/search/search_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: DependenciesBinding(),
      initialRoute: '/search',
      getPages: [
        GetPage(
            name: '/search',
            page: () => SearchPage(),
            binding: SearchBinding()),
        GetPage(
            name: '/detail', page: () => DetailPage(), binding: DetailBinding())
      ],
    );
  }
}
