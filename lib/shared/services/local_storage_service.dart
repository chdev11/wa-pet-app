import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorageService {
  Future<bool> store(String key, {required Map<String, dynamic> data});
  Future<Map<String, dynamic>> read(String key);
  Future<bool> removeKey(String key);
}

class SharedPreferenceService implements ILocalStorageService {
  @override
  Future<bool> store(String key, {required Map<String, dynamic> data}) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.setString(key, jsonEncode(data));
  }

  @override
  Future<Map<String, dynamic>> read(String key) async {
    final prefs = await SharedPreferences.getInstance();

    final result = prefs.getString(key);

    if (result == null) {
      throw Exception("Document key not found.");
    }

    return jsonDecode(result);
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }
}
