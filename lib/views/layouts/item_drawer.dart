import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neura_nest_analyzer/helpers/constants.dart';
import 'package:neura_nest_analyzer/widgets/text.dart';
import 'package:sizer/sizer.dart';

class ItemDrawer extends StatelessWidget {
  List<String> title = [
    "Profile",
    "Stats",
    "Previous work",
    "Favorites",
    "Help",
  ];
  List<IconData> icons = [
    Icons.person,
    Icons.query_stats,
    Icons.receipt_long,
    Icons.favorite_border,
    Icons.help_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: NeuraNestColors.primaryColor,
      width: 60.w,
      child: Column(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 30.sp,
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                ),
                TextAndStyle(
                  text: "Mrs.John",
                  size: 16.sp,
                  weight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: title.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  icons[index],
                  color: NeuraNestColors.whiteColor,
                ),
                title: Text(
                  title[index],
                  style: TextStyle(color: NeuraNestColors.whiteColor),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 8.sp,
              ),
            ),
          )
        ],
      ),
    ).paddingAll(13.sp);
  }
}
