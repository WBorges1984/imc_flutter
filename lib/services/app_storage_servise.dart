import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_CALCULAR_ALTURA,
  CHAVE_CALCULAR_PESO,
}

class AppStorageService {
  /*GET E SET => CHAVE_CALCULAR_ALTURA */
  Future<void> setCalcularAltura(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_CALCULAR_ALTURA.toString(), value);
  }

  Future<double> getCalcularAlturae() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_CALCULAR_ALTURA.toString());
  }

  /*GET E SET => CHAVE_CALCULAR_PESO */
  Future<void> setCalcularPeso(double value) async {
    await _setDouble(STORAGE_CHAVES.CHAVE_CALCULAR_PESO.toString(), value);
  }

  Future<double> getCalcularPeso() async {
    return _getDouble(STORAGE_CHAVES.CHAVE_CALCULAR_PESO.toString());
  }

/* *****FUNÇÕES GET E SET******* */

/* SET E GET STRING */
  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

/* SET E GET STRING LIST*/
  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  /* SET E GET INT */

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  /* SET E GET DOUBLE */

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
  /* SET E GET BOOL */

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
