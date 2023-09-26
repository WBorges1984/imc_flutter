import 'package:flutter/material.dart';
import 'package:imc_flutter/model/resultado_Imc_Class.dart';
import 'package:imc_flutter/repository/calculos_imc_anteriores.dart';
import 'package:imc_flutter/shared/app_image.dart';

class ImcAnteriores extends StatefulWidget {
  const ImcAnteriores({super.key});

  @override
  State<ImcAnteriores> createState() => _ImcAnterioresState();
}

class _ImcAnterioresState extends State<ImcAnteriores> {
  var IcmCalculadas = ImcAnterioresRepository();
  var _imc = const <ResultadoImcAnteriores>[];
  var resultadosAnteriores = [
    {"imc": 25, "img": "MagrezaLeve"},
    {"imc": 18.5, "img": "MagrezaModerada"},
    {"imc": 25, "img": "MagrezaGrave"},
  ];
  var imc = 25;
  var resultImage = "Saudavel";

  void ObterImc() async {
    _imc = await IcmCalculadas.listar();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Card(
          color: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 8,
          child: Column(
            children: [
              SizedBox(height: 10),
              Text("Seu IMC: $imc"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  resultImage == "MagrezaGrave"
                      ? Image.asset(AppImage.MagrezaGrave, height: 50)
                      : resultImage == "MagrezaModerada"
                          ? Image.asset(AppImage.MagrezaModerada, height: 50)
                          : resultImage == "MagrezaLeve"
                              ? Image.asset(AppImage.MagrezaLeve, height: 50)
                              : resultImage == "Saudavel"
                                  ? Image.asset(AppImage.Saudavel, height: 50)
                                  : resultImage == "Sobrepeso"
                                      ? Image.asset(AppImage.SobrePeso,
                                          height: 50)
                                      : resultImage == "ObesidadeGrau1"
                                          ? Image.asset(AppImage.ObesidadeGrau1,
                                              height: 50)
                                          : resultImage == "ObesidadeGrau2"
                                              ? Image.asset(
                                                  AppImage.ObesidadeGrau2,
                                                  height: 50)
                                              : resultImage == "ObesidadeGrau3"
                                                  ? Image.asset(
                                                      AppImage.ObesidadeGrau3,
                                                      height: 50)
                                                  : const Text(''),
                ],
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
