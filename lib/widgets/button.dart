import 'package:flutter/material.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:sizer/sizer.dart';
class NeuraButton extends StatelessWidget {

  String text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 35.w,vertical: 10.sp),
        backgroundColor: NeuraNestColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextAndStyle(
        text: text,
        family: "PoppinsSB",
        size: 13.sp,
      ),
    );
  }

  NeuraButton({
    required this.text,
    this.onTap,
  });
}