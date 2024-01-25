import 'package:shared_preferences/shared_preferences.dart';

class ShrdPrf {
  setShrdPrf(String key, String value) async {
    final shrdPrf = await SharedPreferences.getInstance();
    await shrdPrf.setString(key, value);
  }

  getShrdPrf(key) async {
    final shrdPrf = await SharedPreferences.getInstance();
   return shrdPrf.getString(key);
  }

  clearShrdPrf() async {
    final shrdPrf = await SharedPreferences.getInstance();
  await  shrdPrf.clear();
  }
}
