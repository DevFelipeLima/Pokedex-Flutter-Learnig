import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Pages/aboutPage.dart';
import 'package:pokedex/common/widgest/errorPatern.dart';
import 'package:pokedex/common/widgest/loandingPatern.dart';

import '../../../../../common/errors/failontry.dart';
import '../../../../../common/models/pokemon.dart';
import '../../../../../common/repositories/pkm_repository.dart';

class ArgumentsInfo {
  ArgumentsInfo({required this.pokemon});
  final Pokemon pokemon;
}

class AboutContainer extends StatelessWidget {
  const AboutContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPkmRepository repository;
  final ArgumentsInfo arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoandingPatern();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return AboutPage(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return ErrorPatern(
            error: (snapshot.error as FailOnTry).message!,
          );
        }
        return Container();
      },
    );
  }
}
