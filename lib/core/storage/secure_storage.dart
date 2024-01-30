import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value, aOptions: _getAndroidOptions());
  }

  Future<String> readSecureData(String key) async {
    String value =
        await storage.read(key: key, aOptions: _getAndroidOptions()) ?? '';
    return value;
  }

  deleteSecureData(String key) async {
    await storage.delete(key: key, aOptions: _getAndroidOptions());
  }
}
