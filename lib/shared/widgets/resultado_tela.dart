import 'package:flutter/material.dart';

class ResultadoTela extends StatelessWidget {
  final String imc;
  ResultadoTela({required this.imc});

  @override
  Widget build(BuildContext context) {
    return Text(imc);
  }
}
