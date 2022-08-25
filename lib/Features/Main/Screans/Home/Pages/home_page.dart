import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Screans/Home/Pages/widgets/pkmItemWidget.dart';
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Pokedex',
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            children: list
                .map((e) => PkmItem(
                      pokemon: e,
                      onTap: onItemTap,
                      index: list.indexOf(e),
                    ))
                .toList(),
          ),
        ));
  }
}
