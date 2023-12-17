import 'package:flutter/material.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class TextAndStyle extends StatelessWidget {

  String text;
  Color? color;
  FontWeight? weight;
  double? size;
  String? family;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color ?? NeuraNestColors.whiteColor,
          fontWeight: weight,
          fontSize: size ?? 12.sp,
          fontFamily: "PoppinsRegular"
      ),
    );
  }

  TextAndStyle({
    required this.text,
    this.color,
    this.weight,
    this.size,
    this.family,
  });
}
