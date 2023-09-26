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
  var counter = ["1", "2", "3"];

  void ObterImc() async {
    _imc = await IcmCalculadas.listar();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregaDados();
  }

  carregaDados() {}

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
              Text("Seu IMC"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset(AppImage.MagrezaModerada, height: 50)],
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
