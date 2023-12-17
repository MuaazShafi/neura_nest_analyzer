import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/views/screens/screen_login.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:sizer/sizer.dart';

class OnBoardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;

  // final int numPages = ScreenOnBoarding.images.length;

  void onPageChanged(int index) {
    currentIndex.value = index;
  }
}

class ScreenOnBoarding extends StatelessWidget {
  static List<String> images = [
    'assets/images/cardPic.png',
    'assets/images/cardPic.png',
    'assets/images/cardPic.png',
  ];
  List<String> title = [
    'New Release 1',
    'New Release 2',
    'New Release 3',
  ];

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = Get.put(OnBoardingController());
    return Scaffold(
      backgroundColor: NeuraNestColors.primaryColor,
      appBar: AppBar(
        backgroundColor: NeuraNestColors.primaryColor,
        elevation: 0,
        actions: [
          Obx(() {
            return Center(
              child: GestureDetector(
                onTap: () {
                  Get.offAll(ScreenLogin());
                },
                child: TextAndStyle(
                  text: controller.currentIndex == images.length - 1
                      ? ""
                      : "Skip",
                  size: 13.sp,
                  color: NeuraNestColors.textColor,
                ).paddingOnly(right: 10.sp),
              ),
            );
          }),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 13.h,
                        width: 13.h,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/logo.png"),
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Neura",
                          style: TextStyle(
                            color: NeuraNestColors.secondaryColor,
                            fontSize: 30.sp,
                            fontFamily: "PoppinsEB",
                          ),
                          children: [
                            TextSpan(
                              text: "Nest",
                              style: TextStyle(
                                color: NeuraNestColors.textColor2,
                              ),
                            ),
                            TextSpan(
                              text: "\nA N A L Y Z E R ",
                              style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                fontSize: 17.sp,
                                color: NeuraNestColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  controller.currentIndex == images.length - 1
                      ? ElevatedButton(
                          onPressed: () {
                            Get.offAll(ScreenLogin());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NeuraNestColors.secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: TextAndStyle(
                            text: "Login",
                            color: NeuraNestColors.textColor2,
                          ),
                        ).paddingOnly(bottom: 2.h)
                      : SizedBox(),
                ],
              );
            }),
            Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 3.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: NeuraNestColors.cardColor,
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                physics: BouncingScrollPhysics(),
                itemCount: images.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextAndStyle(
                      text: title[index],
                      family: "PoppinsSB",
                      size: 20.sp,
                    ),
                    Image(
                      image: AssetImage(images[index]),
                    ).paddingSymmetric(horizontal: 17.sp)
                  ],
                ),
              ),
            ).paddingSymmetric(vertical: 13.h),
            Positioned(
              bottom: 10.h,
              left: 37.w,
              child: Container(
                child: Obx(() {
                  return Row(
                    children: List.generate(
                      images.length,
                      (index) => buildDot(
                        index,
                        context,
                        controller.currentIndex.value == index,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 20.sp),
      ),
    );
  }
}

Container buildDot(int index, BuildContext context, bool isActive) {
  return Container(
    padding: EdgeInsets.all(4.sp),
    margin: EdgeInsets.only(right: 10),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isActive
          ? NeuraNestColors.secondaryColor
          : NeuraNestColors.textColor2,
    ),
  );
}
