import 'package:flutter/material.dart';
import 'package:ichinggo/component/icon_tile_widget.dart';
import 'package:ichinggo/component/list.dart';
import 'package:ichinggo/component/one_btn_dialog_widget.dart';
import 'package:ichinggo/controller/hex_search.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/global/app_icons.dart';
import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var today = DateTime.now();
  Hexagram hex = Hexagram([2, 2, 2, 2, 2, 2]);
  TextEditingController controller = TextEditingController();

  // give the suitable greeting words according to the date time
  String toGreeting(DateTime dt) {
    if (dt.hour >= 6 && dt.hour < 12) {
      return 'Good Morning';
    } else if (dt.hour >= 12 && dt.hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  // Convert the datetime to suitable format of time for displaying
  String formatDateTime(DateTime dt) {
    String d = dt.day.toString();
    String m = '';
    String y = dt.year.toString();
    switch (dt.month) {
      case 1:
        m = 'Jan';
        break;
      case 2:
        m = 'Feb';
        break;
      case 3:
        m = 'Mar';
        break;
      case 4:
        m = 'Apr';
        break;
      case 5:
        m = 'May';
        break;
      case 6:
        m = 'Jun';
        break;
      case 7:
        m = 'Jul';
        break;
      case 8:
        m = 'Aug';
        break;
      case 9:
        m = 'Sep';
        break;
      case 10:
        m = 'Oct';
        break;
      case 11:
        m = 'Nov';
        break;
      case 12:
        m = 'Des';
        break;
      default:
        break;
    }
    return d + ' ' + m + ' ' + y;
  }

  // Flash button reaction
  void pressFlash() {
    showDialog(
      context: context,
      builder: (context) => OneBtnDialog(
        dialogText:
            '0 is represented negative;\n1 is represented positive.\n\nThe search bar only accept number 1 and 0.',
        btnText: 'Okay',
        dialogTextStyle: TextStyle(
          color: coal,
        ),
        btnTextStyle: TextStyle(
          color: PureBlu,
        ),
        btnBgColor: Colors.transparent,
        dialogBgColor: snow,
      ),
    );
  }

  // Search Engine reaction
  void pressSearch() {
    var result = searchHex(controller.text);
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
        builder: (context) => OneBtnDialog(
          dialogText: 'There is no result as \"' + controller.text + '\"\nPlease try again :)',
          btnText: 'Okay',
          dialogTextStyle: TextStyle(
            color: coal,
          ),
          btnTextStyle: TextStyle(
            color: PureBlu,
          ),
          btnBgColor: Colors.transparent,
          dialogBgColor: snow,
        ),
      );
    }
  }

  @override
  void initState() {
    if (latestHex.content.first != 2) {
      hex = latestHex;
      controller.text = hex.getHexScript();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            toGreeting(today),
                            style: TextStyle(
                              fontSize: 25,
                              color: coal,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            formatDateTime(today),
                            style: TextStyle(
                              fontSize: 15,
                              color: ash,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      // generated button
                      InkWell(
                        onTap: pressFlash,
                        child: Container(
                          decoration: BoxDecoration(
                            color: bone,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.help_outline,
                            color: coal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25), color: bone),
                    child: TextField(
                      onEditingComplete: pressSearch,
                      controller: controller,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: coal,
                          ),
                          hintText: 'Search',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Symbols',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              IconTile(
                                icon: sky,
                                title: 'Sky',
                                subtitle: 'Qian represents the Sky',
                                color: colorSky,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: pool,
                                title: 'Pool',
                                subtitle: 'Dui represents the Pool',
                                color: colorPool,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: fire,
                                title: 'Fire',
                                subtitle: 'Li represents the Fire',
                                color: colorFire,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: thunder,
                                title: 'Thunder',
                                subtitle: 'Zhen represents the Thunder',
                                color: colorThunder,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: wind,
                                title: 'Wind',
                                subtitle: 'Xun represents the Wind',
                                color: colorWind,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: water,
                                title: 'Water',
                                subtitle: 'Kan represents the Water',
                                color: colorWater,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: mountain,
                                title: 'Mountain',
                                subtitle: 'Gen represents the Mountain',
                                color: colorMoun,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              IconTile(
                                icon: earth,
                                title: 'Earth',
                                subtitle: 'Kun represents the Earth',
                                color: colorEarth,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
