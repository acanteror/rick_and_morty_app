import 'package:colorize_lumberdash/colorize_lumberdash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumberdash/lumberdash.dart';
import 'package:rick_and_morty_app/controller/character_controller.dart';
import 'package:rick_and_morty_app/di/inyector.dart';

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
      home: MyHomePage(title: 'Characters'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: Text('Rick & Morty')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CharacterController.to.fetchData();
        },
        tooltip: 'Fetch Data',
        child: Icon(Icons.file_download),
      ),
    );
  }
}
