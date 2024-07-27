import 'package:rick_and_morty_bloc/data/models/charcters.dart';
import 'package:rick_and_morty_bloc/data/web_services/characters_web_services.dart';


class CharactersRepository{
  final CharactersWebServices charactersWebServices;
  CharactersRepository(this.charactersWebServices);

  Future<List<Result>> getAllCharacters() async {
  final characters = await charactersWebServices.getAllCharacters();
  return characters.map<Result>((character) => Result.fromJson(character)).toList() ;
  }
  }