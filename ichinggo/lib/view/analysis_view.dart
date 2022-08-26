import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinggo/controller/hex_judge.dart';
import 'package:ichinggo/controller/hex_search.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/detail_view.dart';

class AnalysisView extends StatefulWidget {
  final Hexagram hex;

  const AnalysisView({super.key, required this.hex});

  @override
  State<AnalysisView> createState() => _AnalysisViewState();
}

class _AnalysisViewState extends State<AnalysisView> {
  late Hexagram hex;
  late List<int> changers;

  

  

  @override
  void initState() {
    // TODO: implement initState
    hex = widget.hex;
    changers = hex.getIndexsOfChangers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moonlight,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          color: coal,
        ),
        iconTheme: IconThemeData(
          color: coal,
        ),
        title: Text('Analysis'),
        backgroundColor: moonlight,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: moonlight,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    pressSearch(hex.getHexScript(),context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: hex.getHexIconListIn8hex(80),
                  ),
                ),
                InkWell(
                  onTap: () {
                    pressSearch(hex.getOpHexScript(),context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: hex.getOpHexIconListIn8hex(80),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      color: snow),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Original'),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: hex.getHexIconList(25),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 0.5, 5, 0),
                        decoration: BoxDecoration(
                          color: ash,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Changed'),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: hex.getOpHexIconList(25),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                judgeResult(hex.getNumOfChanger(),hex,context),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
