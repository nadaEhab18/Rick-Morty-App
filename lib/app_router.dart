import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_bloc/business_logic/characters_cubit.dart';
import 'package:rick_and_morty_bloc/constants/strings.dart';
import 'package:rick_and_morty_bloc/data/models/charcters.dart';
import 'package:rick_and_morty_bloc/data/repository/characters_repository.dart';
import 'package:rick_and_morty_bloc/data/web_services/characters_web_services.dart';
import 'package:rick_and_morty_bloc/persentation/screens/charactersDetails.dart';
import 'package:rick_and_morty_bloc/persentation/screens/characters_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) =>
                      charactersCubit,
                  child: CharactersScreen(),
                ));
      case charactersDetailsScreen:
        final character = setting.arguments as Result;
        return MaterialPageRoute(builder: (_) => CharactersDetails_screen(character: character,));
    }
  }
}
