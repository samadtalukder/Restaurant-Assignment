import 'package:flutter/material.dart';

class TextUtil extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign alignment;
  final int maxLine;

  const TextUtil({Key key,
    @required this.text,
    this.fontFamily = "",
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontSize = 15,
    this.alignment = TextAlign.center,
    this.maxLine = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: this.alignment,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: this.color,
        fontFamily: this.fontFamily,
        fontWeight: this.fontWeight,
        fontSize: this.fontSize,
      ),
    );
  }
}
