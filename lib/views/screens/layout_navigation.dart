import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/views/layouts/item_drawer.dart';
import 'package:neura_nest_analyzer/views/layouts/layout_home.dart';
import 'package:neura_nest_analyzer/views/layouts/layout_library.dart';
import 'package:neura_nest_analyzer/views/layouts/layout_search.dart';
import 'package:sizer/sizer.dart';

class LayoutNavigation extends StatelessWidget {
  Rx<int> selectedTab = 0.obs;
  List<Widget> layouts = [
    LayoutHome(),
    LayoutSearch(),
    LayoutLibrary(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeuraNestColors.primaryColor,
      appBar: AppBar(
        backgroundColor: NeuraNestColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Obx(() {
          return Text(
            selectedTab.value == 0
                ? "Home"
                : selectedTab.value == 1
                ? "Search"
                : selectedTab.value == 2
                ? "Library"
                : "",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: "PoppinsM",
            ),
          );
        }),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: Obx(() => layouts[selectedTab.value]),
      drawer: ItemDrawer(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 0,
          currentIndex: selectedTab.value,
          onTap: (value) {
            selectedTab.value = value;
            print(selectedTab.value);
          },
          selectedItemColor: NeuraNestColors.secondaryColor,
          unselectedItemColor: NeuraNestColors.textColor,
          backgroundColor: NeuraNestColors.primaryColor,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: SvgPicture.asset("assets/images/home.svg"),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: SvgPicture.asset("assets/images/search.svg"),
            ),
            BottomNavigationBarItem(
              label: "Library",
              icon: SvgPicture.asset("assets/images/library.svg"),
            ),
          ],
        );
      }),
    );
  }
}
