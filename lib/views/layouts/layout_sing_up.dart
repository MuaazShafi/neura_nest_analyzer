import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/widgets/button.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:neura_nest_analyzer/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class LayoutSignUp extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  Rx<bool> isHidden = true.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextAndStyle(
            text: "Sign up",
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
        Obx(() {
          return NeuraTextField(
            hintText: "*Repeat password",
            isHidden: isHidden.value,
            controller: _confirmPasswordController,
            suffixIcon: isHidden.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            onIconTap: () {
              isHidden.value = !isHidden.value;
            },
          );
        }).paddingSymmetric(vertical: 13.sp),
        NeuraButton(
          text: "Sign up",
          onTap: (){

          },
        ).paddingOnly(bottom: 15.sp),
        RichText(
          text: TextSpan(
            text: "By signing up, you agree to our ",
            style: TextStyle(
              fontSize: 12.sp,
            ),
            children: [
              TextSpan(
                text: "Terms, Privacy",
                style: TextStyle(
                  color: NeuraNestColors.secondaryColor,
                ),
              ),
              TextSpan(
                text: " and",
              ),
              TextSpan(
                text: " Cookies Policy.",
                style: TextStyle(
                  color: NeuraNestColors.secondaryColor,
                ),
              ),
            ],
          ),
        )
      ],
    ).paddingSymmetric(horizontal: 20.sp);
  }
}
