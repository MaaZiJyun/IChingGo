import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinggo/component/library_tile_widge.dart';
import 'package:ichinggo/component/list.dart';
import 'package:ichinggo/controller/hex_search.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/detail_view.dart';

class LibraryView extends StatefulWidget {
  const LibraryView({Key? key}) : super(key: key);

  @override
  State<LibraryView> createState() => _LibraryViewState();
}

class _LibraryViewState extends State<LibraryView> {
  TextEditingController controller = TextEditingController();

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
          builder: (context) => AlertDialog(
                content:
                    Text(('There is no result as \"' + controller.text + '\"')),
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: moonlight,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: snow,
              ),
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
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: hexList.length,
                itemBuilder: (context, i) {
                  Hexagram n = hexList.elementAt(i);
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: LibraryTile(
                      hex: n,
                      id: i,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
