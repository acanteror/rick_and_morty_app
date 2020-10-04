import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:rick_and_morty_app/di/inyector.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/characters_page.dart';

void main() {
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  configureInyector();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rick & Morty App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CharactersPage(),
    );
  }
}
