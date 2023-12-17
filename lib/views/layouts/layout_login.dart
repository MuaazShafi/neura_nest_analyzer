import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
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
        ),
        Row(
          children: [

          ],
        )
      ],
    ).paddingSymmetric(horizontal: 20.sp);
  }
}
