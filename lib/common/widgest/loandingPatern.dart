import 'package:flutter/material.dart';

class LoandingPatern extends StatelessWidget {
  const LoandingPatern({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
