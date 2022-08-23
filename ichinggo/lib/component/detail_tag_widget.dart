import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ichinggo/global/app_colors.dart';

class DetailTag extends StatelessWidget {
  final String tagContent;
  final Color tagColor;
  final double fontSize;

  const DetailTag(
      {super.key,
      required this.tagContent,
      required this.tagColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: tagColor,
      ),
      child: Text(
        tagContent,
        style: TextStyle(
          color: moonlight,
          fontSize: 12,
        ),
      ),
    );
  }
}
