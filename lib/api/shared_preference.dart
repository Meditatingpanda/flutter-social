import 'package:shared_preferences/shared_preferences.dart';

class Prefs  {
  // Obtain shared preferences.
  static Future<SharedPreferences>get prefs async {
    return await SharedPreferences.getInstance();
  }

}