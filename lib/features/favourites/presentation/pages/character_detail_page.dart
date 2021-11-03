import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty_app/features/character_detail/domain/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/models/character.dart';

class CharacterDetailPage extends StatelessWidget {
  CharacterDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: Key('characterDetailPageAppBar'),
        title: Text('Character Detail'),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
          key: Key('characterDetailPageBody'),
          cubit: Get.find<CharacterBloc>(),
          builder: (context, state) {
            if (state is CharacterLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CharacterLoaded) {
              final Character _character = state.characterDetail.character;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.network(
                        _character.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(_character.name.toUpperCase()),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Specie: ${_character.species}'),
                    const SizedBox(
                      height: 12,
                    ),
                    Text('Status: ${_character.status}'),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text('No data'),
            );
          }),
    );
  }
}
