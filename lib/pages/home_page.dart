import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import 'package:food_ordering_application/data/menu_layout_data_set.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../widgets/dragable_menu_sheet.dart';
import '../widgets/elCabanyalDesign.dart';
import '../widgets/toggle_switch_button.dart';
import 'menu_layout.dart';

class HomePage extends StatefulWidget {
  bool isInitial;
  HomePage({super.key, required this.isInitial});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MenuLayoutDataSetDataSet listOfMenuData = MenuLayoutDataSetDataSet();
    //get the realavent MenuData
    listOfMenuData.setData();
    final menuDataList = listOfMenuData.menuScreenDataSet;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Elcabanyaldesign(
                          mainImageTopic: "Enjoy your Breakfast !",
                          imageUrl: "https://i2.wp.com/www.personaltrainerfood.com/blog/wp-content/uploads/2020/01/breakfast-is-the-most-important-meal-of-the-day.jpg?resize=1254%2C836&ssl=1",
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select our preferred menu and proceed with your Breakfast",
                            style: mainTopicSize,
                          ),
                        ),
                        MenuLayout(menuDataList: menuDataList),
                      ],
                    ),
                    ToggleSwitchButton()
                  ],
                ),
              ),
            ),
            DragbleMenulist(
              selectedValue: "Breakfast 6am-12pm",
              minimumHeight: widget.isInitial ? 300 : 30,
            ),
          ],
        ),
      ),
    );
  }
}
