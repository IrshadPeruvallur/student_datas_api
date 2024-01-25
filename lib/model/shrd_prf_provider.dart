import 'package:flutter/foundation.dart';
import 'package:student_datas/service/shrd_prfrns.dart';

class ShrdPrfProvider extends ChangeNotifier {
  ShrdPrf shrdPrf = ShrdPrf();
  setShrdPrf(key, value) {
    shrdPrf.setShrdPrf(key, value);
    notifyListeners();
  }

  getShrdPrf(key) {
   return shrdPrf.getShrdPrf(key);
   
  }

  clearShrdPrf() {
    shrdPrf.clearShrdPrf();
    notifyListeners();
  }
}
