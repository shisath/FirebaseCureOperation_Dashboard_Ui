import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final TextAlign? align;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 16.00,
    this.weight = FontWeight.normal,
    this.color = Colors.black,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.justify,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
