import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/views/layouts/layout_login.dart';
import 'package:neura_nest_analyzer/views/layouts/layout_sing_up.dart';
import 'package:sizer/sizer.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: NeuraNestColors.primaryColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Image.asset('assets/images/logo.png')
                  .paddingSymmetric(horizontal: 36.w, vertical: 20.sp),
              TabBar(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15.sp),
                indicator: BoxDecoration(
                  color: NeuraNestColors.secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                tabs: <Widget>[
                  Tab(
                    text: "Login",
                  ),
                  Tab(
                    text: "Signup",
                  ),
                ],
              ).paddingSymmetric(horizontal: 30.sp,vertical: 10.sp),
              Expanded(
                child: Container(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      LayoutLogin(),
                      LayoutSignUp()
                    ],
                  ),
                ).paddingOnly(top: 4.h),
              )
            ],
          ),
        ),
      ),
    );
  }
}


