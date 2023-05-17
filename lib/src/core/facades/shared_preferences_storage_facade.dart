import 'package:shared_preferences/shared_preferences.dart';

import '../contracts/facades/istorage_facade.dart';

class SharedPreferencesStorageFacade implements IStorageFacade {
  SharedPreferences? _sp;
  SharedPreferences get _sharedPreferences {
    final sharedPreferences = _sp;

    if (sharedPreferences == null) {
      throw 'SharedPreferences is not initialized';
    }

    return sharedPreferences;
  }

  @override
  Future initialize() async {
    _sp = await SharedPreferences.getInstance();
  }

  @override
  bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  @override
  double? getDouble(String key) {
    return _sharedPreferences.getDouble(key);
  }

  @override
  int? getInt(String key) {
    return _sharedPreferences.getInt(key);
  }

  @override
  String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  @override
  List<String>? getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }
}
