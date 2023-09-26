import 'package:flutter/material.dart';

class ResultadoImcAnteriores {
  final String _id = UniqueKey().toString();
  double _imc = 0;
  String _imagem = "";

  ResultadoImcAnteriores(this._imc, this._imagem);

  String get id => _id;
  double get getImc => _imc;
  String get getImagem => _imagem;

  set setImc(double imc) {
    _imc = imc;
  }

  set setImagem(String imagem) {
    _imagem = imagem;
  }
}
