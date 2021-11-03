import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:rick_and_morty_app/debug/my_bloc_observer.dart';
import 'package:rick_and_morty_app/di/injector.dart';
import 'package:rick_and_morty_app/features/characters/presentation/pages/characters_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  putLumberdashToWork(withClients: [ColorizeLumberdash()]);
  configureInjector();
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
