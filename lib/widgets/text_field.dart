import 'package:flutter/material.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:sizer/sizer.dart';

class NeuraTextField extends StatelessWidget {
  String hintText;
  bool? isHidden;
  IconData? suffixIcon;
  TextEditingController? controller;
  VoidCallback? onIconTap;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isHidden ?? false,
      style: TextStyle(
        color: NeuraNestColors.textColor,
        fontSize: 12.sp,
        fontFamily: "PoppinsM",
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onIconTap,
          child: Icon(
            suffixIcon,
            color: NeuraNestColors.textColor.withOpacity(0.5),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: NeuraNestColors.textColor,
          fontSize: 10.sp,
          fontFamily: "PoppinsM",
        ),
        filled: true,
        fillColor: NeuraNestColors.textColor2.withOpacity(0.25),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }

  NeuraTextField({
    required this.hintText,
    this.isHidden,
    this.suffixIcon,
    this.controller,
    this.onIconTap,
  });
}
