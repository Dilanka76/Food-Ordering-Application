import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../widgets/dragable_menu_sheet.dart';
import '../widgets/elCabanyalDesign.dart';
import '../widgets/toggle_switch_button.dart';

class LunchHome extends StatefulWidget {
  const LunchHome({super.key});

  @override
  State<LunchHome> createState() => _LunchHomeState();
}

class _LunchHomeState extends State<LunchHome> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<HomePageProvider>(context);
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
                          mainImageTopic: "Enjoy your lunch!",
                          imageUrl:
                              "https://www.denufoods.com/cdn/shop/products/ScreenShot2022-11-20at10.59.18AM_1024x1024.jpg?v=1668935649",
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select our preferred menu and proceed with your Lunch",
                            style: mainTopicSize,
                          ),
                        ),
                      ],
                    ),
                    ToggleSwitchButton()
                  ],
                ),
              ),
            ),
            DragbleMenulist(selectedValue: "Lunch 12pm-6pm", minimumHeight: 30),
          ],
        ),
      ),
    );
  }
}
