import 'package:samplestore/core/constants/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static Future<void> setNavigation({int? index}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(SharedPreferenceLocalName.SHARED_PREFS_KEY_NAGIGATION, index!);
  }

  static Future<int> getNavigation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs
            .getInt(SharedPreferenceLocalName.SHARED_PREFS_KEY_NAGIGATION) ??
        0;
  }
}
