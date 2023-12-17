import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:sizer/sizer.dart';

class ScreenTextAnalyzer extends StatelessWidget {
  String label;

  List<String> images = [
    "assets/images/img8.png",
  ];
  List<String> title = [
    "Text Analyzer",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeuraNestColors.primaryColor,
      appBar: AppBar(
        backgroundColor: NeuraNestColors.primaryColor,
        elevation: 0,
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: "PoppinsM",
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndStyle(
            text: "Category",
            size: 20.sp,
            family: "PoppinsM",
          ).paddingOnly(bottom: 5.h),
          Expanded(
            child: ListView.separated(
              itemCount: images.length,
              shrinkWrap: false,
              itemBuilder: (context, index) => ListTile(
                leading: Image.asset(images[index]),
                title: TextAndStyle(text: title[index],),
              ),
              separatorBuilder: (context, index) =>  SizedBox(height: 15.sp),
            ),
          )
        ],
      ).paddingSymmetric(horizontal: 20.sp),
    );
  }

  ScreenTextAnalyzer({
    required this.label,
  });
}
