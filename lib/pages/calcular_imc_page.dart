import 'package:flutter/material.dart';
import 'package:imc_flutter/model/imc_class.dart';
import 'package:imc_flutter/model/resultado_Imc_Class.dart';
import 'package:imc_flutter/repository/calculos_imc_anteriores.dart';
import 'package:imc_flutter/shared/app_image.dart';
import 'package:imc_flutter/shared/widgets/text_label.dart';

import '../services/app_storage_servise.dart';

class CalcularImcPage extends StatefulWidget {
  const CalcularImcPage({Key? key}) : super(key: key);

  @override
  State<CalcularImcPage> createState() => _CalcularImcPageState();
}

class _CalcularImcPageState extends State<CalcularImcPage> {
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");
  var IcmAnteriores = ImcAnterioresRepository();
  var _imc = const <ResultadoImcAnteriores>[];

  AppStorageService storage = AppStorageService();

  @override
  void initState() => super.initState();

  @override
  Widget build(BuildContext context) {
    var resultText = '';
    String resulClasificacao = '';
    double resultImc = 0;
    String resultImage = '';

    void _esconderTeclado(BuildContext context) {
      FocusScope.of(context).unfocus();
    }

    void criarCalculoImc() {
      String altura = alturaController.text;
      String peso = pesoController.text;
      CalcularImcClass CalcularImc =
          CalcularImcClass(double.parse(altura), double.parse(peso));

      debugPrint(CalcularImc.getAltura.toString());
      debugPrint(CalcularImc.getPeso.toString());
      resultImc =
          CalcularImc.calcularIMC(double.parse(altura), double.parse(peso));
      resulClasificacao = CalcularImc.getSaude;
      resultImage = CalcularImc.getImage;

      debugPrint(resultImc.toString());
      debugPrint(CalcularImc.getSaude);
    }

    return Scaffold(
      /* appBar: AppBar(title: const Text("Meus Dados")), */
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView(
          children: [
            const TextLabel(texto: "Digite sua altura:"),
            TextField(
              keyboardType: TextInputType.number,
              controller: alturaController,
            ),
            const TextLabel(texto: "Digite seu peso:"),
            TextField(
              keyboardType: TextInputType.number,
              controller: pesoController,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (BuildContext bc) {
                      return Column(
                        children: [
                          const SizedBox(height: 15),
                          const Text("Seu Resultado",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple)),
                          const SizedBox(height: 15),
                          Text("Seu IMC é de: $resultImc",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          resultImage == "MagrezaGrave"
                              ? Image.asset(AppImage.MagrezaGrave, height: 80)
                              : resultImage == "MagrezaModerada"
                                  ? Image.asset(AppImage.MagrezaModerada,
                                      height: 80)
                                  : resultImage == "MagrezaLeve"
                                      ? Image.asset(AppImage.MagrezaLeve,
                                          height: 80)
                                      : resultImage == "Saudavel"
                                          ? Image.asset(AppImage.Saudavel,
                                              height: 80)
                                          : resultImage == "Sobrepeso"
                                              ? Image.asset(AppImage.SobrePeso,
                                                  height: 80)
                                              : resultImage == "ObesidadeGrau1"
                                                  ? Image.asset(
                                                      AppImage.ObesidadeGrau1,
                                                      height: 80)
                                                  : resultImage ==
                                                          "ObesidadeGrau2"
                                                      ? Image.asset(
                                                          AppImage
                                                              .ObesidadeGrau2,
                                                          height: 80)
                                                      : resultImage ==
                                                              "ObesidadeGrau3"
                                                          ? Image.asset(
                                                              AppImage
                                                                  .ObesidadeGrau3,
                                                              height: 80)
                                                          : const Text(''),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () async {
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();

                                    Navigator.pop(context);

                                    alturaController.clear();
                                    pesoController.clear();
                                  },
                                  child: Text("Salvar")),
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.redAccent)),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Descartar")),
                            ],
                          )
                        ],
                      );
                    });

                setState(() {
                  try {
                    criarCalculoImc();
                  } catch (e) {
                    debugPrint(e.toString());
                  }
                });
              },
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              shadowColor: Colors.blueAccent,
              elevation: 8,
              child: Column(
                children: [
                  InkWell(
                    child: Image.asset(AppImage.imc, height: 150),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
