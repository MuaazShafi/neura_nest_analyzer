import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/views/screens/screen_image_analyzer.dart';
import 'package:neura_nest_analyzer/views/screens/screen_social_analyzer.dart';
import 'package:neura_nest_analyzer/views/screens/screen_text_analyzer.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:sizer/sizer.dart';

class LayoutHome extends StatelessWidget {
  List<String> images = [
    "assets/images/img1.png",
    "assets/images/img2.png",
    "assets/images/img3.png",
  ];
  List<String> label = [
    "Social Analyzer",
    "Image Analyzer",
    "Text Analyzer",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAndStyle(
          text: "Category",
          size: 20.sp,
          family: "PoppinsM",
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Get.to(ScreenSocialAnalyzer(
                        label: label[index],
                      ));
                    } else if (index == 1) {
                      Get.to(ScreenImageAnalyzer(
                        label: label[index],
                      ));
                    } else if (index == 2) {
                      Get.to(ScreenTextAnalyzer(
                        label: label[index],
                      ));
                    }
                  },
                  child: Image(
                    height: 18.h,
                    image: AssetImage(
                      "${images[index]}",
                    ),
                  ),
                ),
                TextAndStyle(
                  text: label[index],
                ),
              ],
            );
          },
        )
      ],
    ).paddingSymmetric(horizontal: 20.sp);
  }
}
