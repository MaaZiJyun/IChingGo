import 'package:flutter/material.dart';

class OneBtnDialog extends StatelessWidget {
  final String dialogText;
  final String btnText;
  final TextStyle dialogTextStyle;
  final TextStyle btnTextStyle;
  final Color btnBgColor;
  final Color dialogBgColor;

  const OneBtnDialog({super.key, required this.dialogText, required this.btnText, required this.dialogTextStyle, required this.btnTextStyle, required this.btnBgColor, required this.dialogBgColor});


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: dialogBgColor,
        ),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                dialogText,
                softWrap: true,
                style: dialogTextStyle,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: btnBgColor,
                ),
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      btnText,
                      style: btnTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
