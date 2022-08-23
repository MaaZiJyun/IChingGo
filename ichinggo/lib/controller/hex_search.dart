import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';

Hexagram? searchHex(String str){
  if (str.isNotEmpty) {
    for (var h in hexList) {
      print(h.getHexScript());
      if (h.getHexScript() == str) {
        return h;
      }
    }
    return null;
  }
}