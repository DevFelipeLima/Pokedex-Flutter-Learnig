import 'package:flutter/cupertino.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Container/aboutContainer.dart';

import 'package:pokedex/common/errors/failontry.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pkm_repository.dart';

import '../Pages/home_error.dart';
import '../Pages/home_loading.dart';
import '../Pages/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer(
      {Key? key, required this.repository, required this.onItemTap})
      : super(key: key);
  final IPkmRepository repository;
  final Function(String, ArgumentsInfo) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            list: snapshot.data!,
            onItemTap: onItemTap,
          );
        } else if (snapshot.hasError) {
          return HomeError(
            error: (snapshot.error as FailOnTry).message!,
          );
        }
        return Container();
      },
    );
  }
}
