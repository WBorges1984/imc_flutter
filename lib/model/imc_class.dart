class CalcularImcClass {
  double _altura = 0;
  double _peso = 0;
  String _saude = '';
  String _image = '';

  CalcularImcClass(this._altura, this._peso);

  double get getAltura => _altura;

  set setAltura(double altura) {
    _altura = altura;
  }

  double get getPeso => _peso;

  set setPeso(double peso) {
    _peso = peso;
  }

  String get getSaude => _saude;

  set setSaude(String saude) {
    _saude = saude;
  }

  String get getImage => _image;

  set setImage(String image) {
    _image = image;
  }

  bool isMagrezaGrave(double imc) => imc < 16;
  bool isMagrezaModerada(double imc) => imc == 16 && imc < 17;
  bool isMagrezaLeve(double imc) => imc == 16 && imc < 17;
  bool isSaudavel(double imc) => imc == 16 && imc < 17;
  bool issobrePeso(double imc) => imc == 16 && imc < 17;
  bool isobesidadeGrauI(double imc) => imc == 16 && imc < 17;
  bool isobesidadeGrauII(double imc) => imc == 16 && imc < 17;
  bool isobesidadeGrauIII(double imc) => imc == 16 && imc < 17;

  double calcularIMC(double altura, double peso) {
    String imcFormatado = '';
    double imc = peso / (altura * altura);
    imcFormatado = imc.toStringAsFixed(2);

    if (imc < 16) {
      setSaude = "Magreza Grave";
      setImage = "MagrezaGrave";
    } else if (imc < 17) {
      setSaude = "Magreza Moderada";
      setImage = "MagrezaModerada";
    } else if (imc < 18.5) {
      setSaude = "Magreza Leve";
      setImage = "MagrezaLeve";
    } else if (imc < 25) {
      setSaude = "Saudável";
      setImage = "Saudavel";
    } else if (imc < 30) {
      setSaude = "Sobrepeso";
      setImage = "Sobrepeso";
    } else if (imc < 35) {
      setSaude = "Obesidade Grau I";
      setImage = "ObesidadeGrau1";
    } else if (imc < 40) {
      setSaude = "Obesidade Grau II (Severa)";
      setImage = "ObesidadeGrau2";
    } else {
      setSaude = "Obesidade Grau III (Mórbida)";
      setImage = "ObesidadeGrau3";
    }

    return double.parse(imcFormatado);
  }
}
