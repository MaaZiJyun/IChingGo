import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinggo/global/app_colors.dart';

class detailTile extends StatelessWidget {
  final String word;
  final bool positive;
  final bool position;

  const detailTile({
    super.key,
    required this.word,
    required this.positive,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: snow,
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          position
              ? Icon(
                  positive ? Icons.light_mode : Icons.dark_mode,
                  size: 30,
                  color: positive ? colorSun : colorMoon,
                )
              : Icon(
                  positive ? Icons.light_mode : Icons.dark_mode,
                  size: 30,
                  color: ash,
                ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              word,
              softWrap: true,
              style: TextStyle(
                fontSize: 13,
                color: coal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
