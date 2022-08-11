import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/common/consts/API_const.dart';
import 'package:pokedex/common/errors/failontry.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPkmRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PkmRepository implements IPkmRepository {
  final Dio dio;

  PkmRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(APIconst.PkmApiUrl);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      //as List<Map<String, dynamic>> : por que a minha classe abstrata é tratada como List, apesar do meu json decode ser so Map<String... passei 30 min tentando entender pq os parametros nao batiam com o que eu tava passando no return.
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } catch (e) {
      throw FailOnTry(message: 'Fail on try connection with server');
    }
  }
}
