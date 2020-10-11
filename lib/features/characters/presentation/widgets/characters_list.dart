import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/characters_bloc.dart';
import 'package:rick_and_morty_app/features/characters/infraestructure/models/result.dart';
import 'package:rick_and_morty_app/features/characters/presentation/widgets/character_list_item.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({
    Key key,
    @required this.charactersBloc,
  }) : super(key: key);

  final CharactersBloc charactersBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      cubit: charactersBloc,
      builder: (context, state) {
        if (state is CharactersLoaded) {
          final List<Result> _results = state.characters;
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _results.length,
            itemBuilder: (BuildContext context, int index) {
              final Result _character = _results[index];
              return CharacterListItem(
                key: Key('characterListItem'),
                character: _character,
              );
            },
          );
        }
        if (state is CharactersLoading) {
          return Center(
            key: Key('loading'),
            child: CircularProgressIndicator(key: Key('loadingImage')),
          );
        }
        return Center(
          key: Key('initialMessage'),
          child: Text('Pulse para cargar personajes.',
              key: Key(
                'initialMessageText',
              )),
        );
      },
    );
  }
}
