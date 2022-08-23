import 'dart:math';

class HexCalc {
  static int judge(bool result) {
    if (result) {
      return 3;
    } else {
      return 2;
    }
  }

  static int toss() {
    bool coinA = Random().nextBool();
    bool coinB = Random().nextBool();
    bool coinC = Random().nextBool();
    return judge(coinA) + judge(coinB) + judge(coinC);
  }

  static List<int> generateHexNumber(){
    List<int> list = [];
    for (var i = 0; i < 6; i++) {
      list.add(toss());
    }
    return list;
  }
}
