import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Features/Main/Routes.dart';
import 'package:pokedex/common/repositories/pkm_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pokedex - Flutter',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: PkdxRoute(
          repository: PkmRepository(
            dio: Dio(),
          ),
        ));
  }
}
