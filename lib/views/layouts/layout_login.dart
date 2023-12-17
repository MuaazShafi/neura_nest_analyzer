import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/views/screens/layout_navigation.dart';
import 'package:neura_nest_analyzer/widgets/button.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:neura_nest_analyzer/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class LayoutLogin extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Rx<bool> isHidden = true.obs;
  Rx<bool> isCheck = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextAndStyle(
            text: "Login",
            size: 21.sp,
            family: "PoppinsSB",
          ),
        ),
        NeuraTextField(hintText: "*Email", controller: _nameController)
            .paddingSymmetric(vertical: 13.sp),
        Obx(() {
          return NeuraTextField(
            hintText: "*Password",
            controller: _passwordController,
            isHidden: isHidden.value,
            suffixIcon: isHidden.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            onIconTap: () {
              isHidden.value = !isHidden.value;
            },
          );
        }),
        Align(
          alignment: Alignment.centerLeft,
          child: TextAndStyle(
            text: "Forgot password?",
            size: 11.sp,
            color: NeuraNestColors.secondaryColor,
          ).paddingSymmetric(vertical: 10.sp),
        ),
        NeuraButton(
          text: "Login",
          onTap: (){
            Get.to(LayoutNavigation());
          },
        ),
        Obx(() {
          return CheckboxListTile(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            controlAffinity: ListTileControlAffinity.leading,
            checkColor: NeuraNestColors.whiteColor,
            activeColor: NeuraNestColors.secondaryColor,
            title: TextAndStyle(
              text: "Remember me",
              size: 11.sp,
            ),
            value: isCheck.value,
            onChanged: (value) {
              isCheck.value = value!;
            },
          );
        }),
        TextAndStyle(
          text: "Other sign in options",
          size: 11.sp,
        ).paddingOnly(bottom: 15.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(),
            Container(
              decoration: BoxDecoration(
                color: NeuraNestColors.textColor2,
                shape: BoxShape.circle,
                border: Border.all(color: NeuraNestColors.whiteColor),
              ),
              child: SvgPicture.asset("assets/images/Facebook.svg").paddingAll(10.sp),
            ),
            Container(
              decoration: BoxDecoration(
                color: NeuraNestColors.textColor2,
                shape: BoxShape.circle,
                border: Border.all(color: NeuraNestColors.whiteColor),
              ),
              child: SvgPicture.asset("assets/images/Google.svg").paddingAll(10.sp),
            ),
            Container(
              decoration: BoxDecoration(
                color: NeuraNestColors.textColor2,
                shape: BoxShape.circle,
                border: Border.all(color: NeuraNestColors.whiteColor),
              ),
              child: SvgPicture.asset("assets/images/Apple.svg").paddingAll(10.sp),
            ),
            SizedBox(),
          ],
        )
      ],
    ).paddingSymmetric(horizontal: 20.sp);
  }
}
