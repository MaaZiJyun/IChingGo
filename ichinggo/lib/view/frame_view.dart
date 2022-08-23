import 'package:flutter/material.dart';
import 'package:ichinggo/component/list.dart';
import 'package:ichinggo/global/app_colors.dart';
import 'package:ichinggo/global/app_vars.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/home_view.dart';
import 'package:ichinggo/view/library_view.dart';
import 'package:ichinggo/view/yallow_view.dart';

class FrameView extends StatefulWidget {
  const FrameView({Key? key}) : super(key: key);

  @override
  State<FrameView> createState() => _FrameViewState();
}

class _FrameViewState extends State<FrameView> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    YallowView(),
    LibraryView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    for (var e in hexagramNumList) {
      List<int> newContent =
          e['Content'].toString().split(';').map(int.parse).toList();
      List<String> newWords = e['Words'].toString().split(';').toList();
      Hexagram h = Hexagram(newContent);
      h.words = newWords;
      h.name = e['Name'].toString();
      h.symbols = e['Symbol'].toString();
      h.evaluation = e['Evaluation'].toString();
      hexList.add(h);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: snow,
      // appBar: AppBar(
      //   backgroundColor: snow,
      //   elevation: 0,
      //   title: const Text(
      //     'IChing GO',
      //     style: TextStyle(
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: snow,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.eco),
            label: 'Yallow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: coal,
        unselectedItemColor: ash,
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
