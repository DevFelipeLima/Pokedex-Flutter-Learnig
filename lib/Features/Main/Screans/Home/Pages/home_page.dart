import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Infos/Container/aboutContainer.dart';
import 'package:pokedex/common/models/pokemon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);
  final List<Pokemon> list;
  final Function(String, ArgumentsInfo) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(list[index].name),
          onTap: onItemTap('/about', ArgumentsInfo(name: list[index].name)),
        );
      },
    ));
  }
}
