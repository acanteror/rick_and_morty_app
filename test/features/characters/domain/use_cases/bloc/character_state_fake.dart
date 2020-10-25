import 'package:rick_and_morty_app/features/characters/domain/use_cases/bloc/characters_bloc.dart';

import '../../../infraestructure/dto/fakes/data_fake.dart';

final CharactersInitial tCharactersInitial = CharactersInitial();
final CharactersLoading tCharactersLoading = CharactersLoading();
final CharactersError tCharactersError = CharactersError();
final CharactersLoaded tCharactersLoaded = CharactersLoaded(characters: tData.results);
