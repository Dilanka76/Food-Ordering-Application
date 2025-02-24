import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../widgets/dragable_menu_sheet.dart';
import '../widgets/elCabanyalDesign.dart';
import '../widgets/toggle_switch_button.dart';

class DinnerHome extends StatefulWidget {
  const DinnerHome({super.key});

  @override
  State<DinnerHome> createState() => _DinnerHomeState();
}

class _DinnerHomeState extends State<DinnerHome> {
  @override
  Widget build(BuildContext context) {
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
                          mainImageTopic: "Enjoy your Dinner!",
                          imageUrl:
                              "https://images.immediate.co.uk/production/volatile/sites/30/2017/08/crispy-sesame-lemon-chicken-8830c24.jpg?quality=90&resize=556,505",
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select our preferred menu and proceed with your Dinner",
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
            DragbleMenulist(
              selectedValue: "Dinner 6pm-12am",
              minimumHeight: 30,
            ),
          ],
        ),
      ),
    );
  }
}
