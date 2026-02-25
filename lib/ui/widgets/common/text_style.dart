import 'package:faiztask/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class CusText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? textAlign;
  final double height;

   const CusText(
    this.text, {
    Key? key,
    this.fontSize = 14,   
    this.fontWeight = FontWeight.w400, 
    this.color = navy,        
    this.textAlign,
    this.height = 1.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'SFProDisplay', 
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: 1.5,
        color: color,
      ),
    );
  }
}