import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/result/result_model.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_list_item.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        cubit: Get.find<CharacterBloc>(),
        builder: (context, state) {
          if (state is CharacterLoaded) {
            final List<Result> _results = state.characters;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _results.length,
              itemBuilder: (BuildContext context, int index) {
                final Result _character = _results[index];
                return CharacterListItem(character: _character);
              },
            );
          }
          if (state is CharacterLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Center(child: Text('Pulse para cargar personajes.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<CharacterBloc>().add(CharacterFetch());
        },
        tooltip: 'Fetch Data',
        child: Icon(Icons.file_download),
      ),
    );
  }
}
