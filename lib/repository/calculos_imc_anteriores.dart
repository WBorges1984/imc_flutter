import 'package:imc_flutter/model/resultado_Imc_Class.dart';

class ImcAnterioresRepository {
  List<ResultadoImcAnteriores> _imc = [];

  Future<void> adicionar(ResultadoImcAnteriores Imc) async {
    await Future.delayed(const Duration(microseconds: 100));
    _imc.add(Imc);
  }

  Future<List<ResultadoImcAnteriores>> listar() async {
    await Future.delayed(const Duration(microseconds: 100));
    return _imc;
  }
}
