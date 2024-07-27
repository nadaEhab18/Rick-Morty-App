import 'package:flutter/material.dart';
import 'package:rick_and_morty_bloc/app_router.dart';

void main() {
  runApp(RickAndMorty(appRouter:AppRouter(),));
}

class RickAndMorty extends StatelessWidget {
 final AppRouter appRouter ;
  const RickAndMorty({Key? key, required this.appRouter,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

