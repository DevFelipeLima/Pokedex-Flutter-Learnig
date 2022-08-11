import 'package:flutter/cupertino.dart';
import 'package:pokedex/Home/Pages/home_error.dart';
import 'package:pokedex/Home/Pages/home_loading.dart';
import 'package:pokedex/Home/Pages/home_page.dart';
import 'package:pokedex/common/errors/failontry.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/common/repositories/pkm_repository.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPkmRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeLoading();
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(list: snapshot.data!);
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
