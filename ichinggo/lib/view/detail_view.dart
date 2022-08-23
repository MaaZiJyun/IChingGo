import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinggo/component/detail_tag_widget.dart';
import 'package:ichinggo/component/detail_tile_widget.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/model/hexagram_model.dart';

class DetailView extends StatefulWidget {
  final Hexagram h;

  const DetailView({super.key, required this.h});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  List<Widget> generateDetail(Hexagram h) {
    List<Widget> list = [];
    list.add(
      SizedBox(
        height: 20,
      ),
    );
    for (var i = 0; i < 6; i++) {
      var positive = true;
      var position = true;
      if (i % 2 == 0) {
        //yang position
        if (h.getHexInByte().elementAt(i) == 1) {
          position = true;
        } else {
          position = false;
        }
      } else {
        if (h.getHexInByte().elementAt(i) == 0) {
          position = true;
        } else {
          position = false;
        }
      }
      if (h.getHexInByte().elementAt(i) != 1) {
        positive = false;
      }
      list.add(detailTile(
        word: h.words.elementAt(i),
        positive: positive,
        position: position,
      ));
      list.add(
        SizedBox(
          height: 10,
        ),
      );
    }
    list.add(
      SizedBox(
        height: 10,
      ),
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: coal,
        ),
        iconTheme: IconThemeData(
          color: coal,
        ),
        title: Text(widget.h.name + ' 卦'),
        backgroundColor: snow,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(80, 10, 80, 40),
                decoration: BoxDecoration(
                  color: snow,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: widget.h.getHexIconListIn8hex(80),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(widget.h.symbols),
                    SizedBox(
                      height: 10,
                    ),
                    DetailTag(
                          tagContent: widget.h.evaluation,
                          tagColor: widget.h.evaluation == 'Positive'
                              ? pureGre
                              : pureRed,
                          fontSize: 12,
                        ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: ListView(
                    children: generateDetail(widget.h),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
