import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/features/template/presentation/pages/template_page.dart';
import 'core/helpers/dependencies.dart' as dep;
import 'package:get/get.dart';

Future<void> main() async {
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Clean Architecture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TemplatePage(),
    );
  }
}

