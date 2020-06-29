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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GetBuilder<CharacterController>(
          init: CharacterController(),
          builder: (_) {
            final _results = _.data?.results ?? [];
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _results.length,
                itemBuilder: (BuildContext context, int index) {
                  final _character = _results[index];
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Image.network(_character.image),
                      title: Text(_character.name.toUpperCase()),
                      subtitle: Text('Status: ${_character.status}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  );
                });
          }),
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
