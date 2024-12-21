import 'package:shared_preferences/shared_preferences.dart';

const stringKey = "stringKey";

class LocalDate {
  static salvarString(String valor) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    print("--------------------------");
    print(valor);
    shared.setString(stringKey, valor);
  }

  static Future<String> retornaString() async {
    SharedPreferences shared = await SharedPreferences.getInstance();

    return shared.getString(stringKey) ?? 'Vazio';
  }
}
