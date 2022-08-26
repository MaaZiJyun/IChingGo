import 'package:flutter/material.dart';
import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/detail_view.dart';

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

void pressSearch(String text, BuildContext context) {
    var result = searchHex(text);
    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailView(
            h: result,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(('There is no result as \"' + text + '\"')),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Okay"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }