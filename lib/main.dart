import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/views/screens/screen_on_boarding.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(NeuraNest());

class NeuraNest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Neura_Nest Analyzer',
        home: ScreenOnBoarding(),
      ),
    );
  }
}
