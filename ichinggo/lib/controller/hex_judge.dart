import 'package:flutter/material.dart';
import 'package:ichinggo/component/detail_tile_widget.dart';
import 'package:ichinggo/controller/hex_search.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/model/hexagram_model.dart';

List<Widget> whenChangesMoreThanOne(Hexagram h, List<int> nums) {
  List<Widget> list = [];
  for (var i = 0; i < nums.length; i++) {
    list.add(
      ListTile(
        title: Text('${h.name}'),
        subtitle: Text('${h.words.elementAt(nums.elementAt(i))}'),
      ),
    );
  }
  return list;
}

Container judgeResult(int num, Hexagram hex, BuildContext context) {
  Container item = Container();
  Hexagram? infoH = searchHex(hex.getHexScript());
  Hexagram? infoOpH = searchHex(hex.getOpHexScript());
  switch (num) {
    case 1:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('一爻变，以本卦变爻爻辞断'),
            InkWell(
              onTap: () {
                pressSearch(hex.getHexScript(), context);
              },
              child: Column(
                children: whenChangesMoreThanOne(
                    infoH ?? hex, hex.getIndexsOfChangers()),
              ),
            ),
          ],
        ),
      );
      break;
    case 2:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('二爻变，以本卦两个爻辞断，以上为主'),
            InkWell(
              onTap: () {
                pressSearch(hex.getHexScript(), context);
              },
              child: Column(
                children: whenChangesMoreThanOne(
                    infoH ?? hex, hex.getIndexsOfChangers()),
              ),
            ),
          ],
        ),
      );
      break;
    case 3:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('三爻变，以本卦与变卦卦辞断；本卦卦辞为贞，变卦为悔'),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: hex.getHexIconListIn8hex(25),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: hex.getOpHexIconListIn8hex(25),
                ),
              ),
          ],
        ),
      );
      break;
    case 4:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('四爻变，以变卦之两不变爻辞断，以下为主'),
            InkWell(
              onTap: () {
                pressSearch(hex.getOpHexScript(), context);
              },
              child: Column(
                children: whenChangesMoreThanOne(
                    infoOpH ?? hex, hex.getIndexsOfNonChangers()),
              ),
            ),
          ],
        ),
      );
      break;
    case 5:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('五爻变，以变卦不变之爻辞断'),
            InkWell(
              onTap: () {
                pressSearch(hex.getOpHexScript(), context);
              },
              child: Column(
                children: whenChangesMoreThanOne(
                    infoOpH ?? hex, hex.getIndexsOfNonChangers()),
              ),
            ),
          ],
        ),
      );
      break;
    case 6:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('六爻变，以变卦卦辞断，乾坤则以【用】辞断'),
            InkWell(
              onTap: () {
                pressSearch(hex.getHexScript(), context);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: hex.getOpHexIconListIn8hex(25),
                ),
              ),
            ),
          ],
        ),
      );
      break;
    default:
      item = Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)), color: snow),
        child: Column(
          children: [
            Text('六爻不变，以本卦卦辞断'),
            InkWell(
              onTap: () {
                pressSearch(hex.getHexScript(), context);
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: hex.getHexIconListIn8hex(25),
                ),
              ),
            ),
          ],
        ),
      );
      break;
  }
  return item;
}
