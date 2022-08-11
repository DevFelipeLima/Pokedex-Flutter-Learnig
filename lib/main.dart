import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/Home/Pages/home_page.dart';
import 'package:pokedex/Home/container/home_container.dart';
import 'package:pokedex/common/repositories/pkm_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex - Flutter 2K22',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeContainer(
        repository: PkmRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
