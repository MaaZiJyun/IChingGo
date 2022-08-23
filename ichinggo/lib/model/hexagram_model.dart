import 'package:flutter/material.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/global/app_icons.dart';

class Hexagram {
  String name = '';
  final List<int> content;
  List<String> words = [];
  String symbols = '';
  String evaluation = '';

  Hexagram(this.content);

  Icon get8hex(int x, int y, int z, double iconSize) {
    // double iconSize = 120;
    if (x == 1 && y == 1 && z == 1) {
      return Icon(
        sky,
        size: iconSize,
        color: colorSky,
      );
    } else if (x == 0 && y == 0 && z == 0) {
      return Icon(
        earth,
        size: iconSize,
        color: colorEarth,
      );
      ;
    } else if (x == 1 && y == 0 && z == 0) {
      return Icon(
        thunder,
        size: iconSize,
        color: colorThunder,
      );
      ;
    } else if (x == 0 && y == 0 && z == 1) {
      return Icon(
        mountain,
        size: iconSize,
        color: colorMoun,
      );
      ;
    } else if (x == 1 && y == 0 && z == 1) {
      return Icon(
        fire,
        size: iconSize,
        color: colorFire,
      );
    } else if (x == 0 && y == 1 && z == 0) {
      return Icon(
        water,
        size: iconSize,
        color: colorWater,
      );
      ;
    } else if (x == 0 && y == 1 && z == 0) {
      return Icon(
        pool,
        size: iconSize,
        color: colorPool,
      );
    } else {
      return Icon(
        wind,
        size: iconSize,
        color: colorWind,
      );
    }
  }

  List<Icon> generateHexIn8hex(List<int> h, double iconSize) {
    List<Icon> list = [];
    list.add(get8hex(
      h.elementAt(0),
      h.elementAt(1),
      h.elementAt(2),
      iconSize,
    ));
    list.add(get8hex(
      h.elementAt(3),
      h.elementAt(4),
      h.elementAt(5),
      iconSize,
    ));
    return list;
  }

  List<Icon> generateHex(List<int> h, double smallIcon) {
    List<Icon> list = [];
    for (var i = 0; i < h.length; i++) {
      if (h.elementAt(i) == 6) {
        list.add(Icon(
          Icons.dark_mode,
          size: smallIcon,
          color: ash,
        ));
      } else if (h.elementAt(i) == 7) {
        list.add(Icon(
          Icons.light_mode,
          size: smallIcon,
          color: ash,
        ));
      } else if (h.elementAt(i) == 8) {
        list.add(Icon(
          Icons.dark_mode,
          size: smallIcon,
          color: coal,
        ));
      } else {
        list.add(Icon(
          Icons.light_mode,
          size: smallIcon,
          color: coal,
        ));
      }
    }
    return list;
  }

  List<int> generateOpHex(List<int> h) {
    List<int> list = [];
    for (var i = 0; i < h.length; i++) {
      if (h.elementAt(i) == 6) {
        list.add(6);
      } else if (h.elementAt(i) == 7) {
        list.add(7);
      } else if (h.elementAt(i) == 8) {
        list.add(7);
      } else {
        list.add(6);
      }
    }
    return list;
  }

  List<int> hexToByte(List<int> hex) {
    List<int> list = [];
    for (var i = 0; i < hex.length; i++) {
      if (hex.elementAt(i) == 7 || hex.elementAt(i) == 9) {
        list.add(1);
      } else {
        list.add(0);
      }
    }
    if (hex.first == 1 || hex.first == 0) {
      return hex;
    } else {
      return list;
    }
  }

  List<int> getOpHex() {
    List<int> list = generateOpHex(content);
    return list;
  }

  List<int> getHexInByte() {
    List<int> list = hexToByte(content);
    return list;
  }

  List<int> getOpHexInByte() {
    List<int> list = hexToByte(getOpHex());
    return list;
  }

  List<Icon> getHexIconList(double smallIcon) {
    return generateHex(content, smallIcon);
  }

  List<Icon> getOpHexIconList(double smallIcon) {
    return generateHex(getOpHex(), smallIcon);
  }

  List<Icon> getHexIconListIn8hex(double size) {
    return generateHexIn8hex(getHexInByte(), size);
  }

  List<Icon> getOpHexIconListIn8hex(double size) {
    return generateHexIn8hex(getOpHexInByte(), size);
  }

  String transferHexToScript(List<int> h) {
    String str = '';
    for (var i in h) {
      str += i.toString();
    }
    return str;
  }

  List<int> transferScriptToHex(String str) {
    return str.split('').map(int.parse).toList();
  }

  String getHexScript() {
    return transferHexToScript(getHexInByte());
  }

  String getOpHexScript() {
    return transferHexToScript(getOpHexInByte());
  }
}
