import 'package:flutter/material.dart';
import 'package:ichinggo/model/hexagram_model.dart';
import 'package:ichinggo/view/detail_view.dart';
import 'dart:math' as math;
import '../global/app_colors.dart';

class LibraryTile extends StatelessWidget {
  final Hexagram hex;
  final int id;

  const LibraryTile({super.key, required this.hex, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(hex.content.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(
              h: hex,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: snow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    
                    // color:
                        // Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                        //     .withOpacity(1.0)
                        
                    child: Column(
                      children: [
                        hex.getHexIconListIn8hex(30).elementAt(1),
                        hex.getHexIconListIn8hex(30).elementAt(0),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hex.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      hex.symbols,
                      style: TextStyle(
                        fontSize: 12,
                        color: ash,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ],
            ),
            Icon(Icons.more_horiz),
          ],
        ),
      ),
    );
  }
}
