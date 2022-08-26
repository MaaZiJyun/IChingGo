import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ichinggo/controller/hex_calculation.dart';
import 'package:ichinggo/controller/hex_search.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/global/app_icons.dart';
import 'dart:math' as math;
import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/analysis_view.dart';
import 'package:ichinggo/view/detail_view.dart';

class YallowView extends StatefulWidget {
  const YallowView({Key? key}) : super(key: key);

  @override
  State<YallowView> createState() => _YallowViewState();
}

class _YallowViewState extends State<YallowView> {
  Hexagram hex = Hexagram([2, 2, 2, 2, 2, 2]);
  bool wait = false;
  late Timer timer;
  Icon iconLoading1 = Icon(
    sky,
    size: 80,
    color: ash,
  );
  Icon iconLoading2 = Icon(
    sky,
    size: 80,
    color: ash,
  );
  Icon iconLoading3 = Icon(
    sky,
    size: 80,
    color: ash,
  );
  Icon iconLoading4 = Icon(
    sky,
    size: 80,
    color: ash,
  );
  List<Icon> icon8hexList = [
    Icon(
      sky,
      size: 80,
      color: ash,
    ),
    Icon(
      earth,
      size: 80,
      color: ash,
    ),
    Icon(
      water,
      size: 80,
      color: ash,
    ),
    Icon(
      fire,
      size: 80,
      color: ash,
    ),
    Icon(
      wind,
      size: 80,
      color: ash,
    ),
    Icon(
      thunder,
      size: 80,
      color: ash,
    ),
    Icon(
      mountain,
      size: 80,
      color: ash,
    ),
    Icon(
      pool,
      size: 80,
      color: ash,
    ),
  ];

  void pressStart() {
    if (!mounted) return;
    setState(() {
      wait = true;
    });
    setLoadingTimer();
  }

  Future<void> setLoadingTimer() async {
    timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (!mounted) return;
      setState(() {
        iconLoading1 = icon8hexList.elementAt(math.Random().nextInt(7));
        iconLoading2 = icon8hexList.elementAt(math.Random().nextInt(7));
        iconLoading3 = icon8hexList.elementAt(math.Random().nextInt(7));
        iconLoading4 = icon8hexList.elementAt(math.Random().nextInt(7));
      });
    });
    await Future.delayed(const Duration(seconds: 3));
    timer.cancel;
    if (!mounted) return;
    setState(() {
      wait = false;
      hex = Hexagram(HexCalc.generateHexNumber());
      latestHex = hex;
    });
  }

  void pressSearch(String text) {
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
              ));
    }
  }

  @override
  void initState() {
    if (latestHex.content.first != 2) {
      hex = latestHex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: hex.content.first != 2
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     pressSearch(hex.getHexScript());
                  //   },
                  //   onLongPress: () {
                  //     if (!mounted) return;
                  //     setState(() {
                  //       hex = Hexagram([2, 2, 2, 2, 2, 2]);
                  //     });
                  //   },
                  //   child: Container(
                  //     child: Column(
                  //       children: [
                  //         // Container(
                  //         //   padding: EdgeInsets.symmetric(horizontal: 70),
                  //         //   child: Row(
                  //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //     children: hex.getHexIconList(25),
                  //         //   ),
                  //         // ),
                  //         Container(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: hex.getHexIconListIn8hex(80),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnalysisView(
                            hex: hex,
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      if (!mounted) return;
                      setState(() {
                        hex = Hexagram([2, 2, 2, 2, 2, 2]);
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: hex.getHexIconListIn8hex(80),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: hex.getOpHexIconListIn8hex(80),
                            ),
                          ),
                          Text(
                            'Long Press to Cancel',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     pressSearch(hex.getOpHexScript());
                  //   },
                  //   onLongPress: () {
                  //     if (!mounted) return;
                  //     setState(() {
                  //       hex = Hexagram([2, 2, 2, 2, 2, 2]);
                  //     });
                  //   },
                  //   child: Container(
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: hex.getOpHexIconListIn8hex(80),
                  //           ),
                  //         ),
                  //         // Container(
                  //         //   padding: EdgeInsets.symmetric(horizontal: 70),
                  //         //   child: Row(
                  //         //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //     children: hex.getOpHexIconList(25),
                  //         //   ),
                  //         // ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            )
          : Center(
              child: wait
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              iconLoading1,
                              iconLoading2,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              iconLoading3,
                              iconLoading4,
                            ],
                          ),
                          Text(
                            'A new hexagram is generating',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: pressStart,
                            borderRadius: BorderRadius.circular(80),
                            highlightColor: moonlight,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: coal,
                              ),
                              child: Icon(
                                Icons.power_settings_new,
                                color: snow,
                                size: 40,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Press to Begin',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
    );
  }
}
