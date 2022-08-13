import 'package:flutter/material.dart';

class ErrorPatern extends StatelessWidget {
  const ErrorPatern({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error ?? "Não foi possivel carregar os dados!")),
    );
  }
}
