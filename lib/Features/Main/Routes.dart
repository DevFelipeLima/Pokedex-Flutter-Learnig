import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Home/container/home_container.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Container/aboutContainer.dart';
import 'package:pokedex/common/repositories/pkm_repository.dart';

class PkdxRoute extends StatelessWidget {
  const PkdxRoute({
    Key? key,
    required this.repository,
  }) : super(key: key);
  final PkmRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      //parametro de rota inicial
      initialRoute: '/',
      onGenerateRoute: (settings) {
        //condição para iniciar o route
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            //passando o parametro de rota para a home
            return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                });
          });
        } else if (settings.name == '/about') {
          return MaterialPageRoute(builder: (context) {
            return AboutContainer(
                repository: repository,
                arguments: (settings.arguments) as ArgumentsInfo);
          });
        } //Parametro para rota de informações sobre o pokemon.
      },
    );
  }
}
