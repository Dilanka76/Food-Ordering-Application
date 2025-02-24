import 'package:flutter/material.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../constant/colors_padding_sizes.dart';

class ToggleSwitchButton extends StatefulWidget {
  const ToggleSwitchButton({super.key});

  @override
  State<ToggleSwitchButton> createState() => _ToggleSwtichButtonState();
}

class _ToggleSwtichButtonState extends State<ToggleSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      left: 0, // Ensures it's centered horizontally
      right: 0,
      top: 205- 25, // Moves it halfway between black and red containers
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1, // Border width
            ),
            borderRadius: BorderRadius.circular(20), // Border radius to match the toggle's corner radius
          ),
          child: ToggleSwitch(
            customWidths: [50.0, 50.0, 50.0],
            cornerRadius: 20.0,
            activeBgColors: [
              [mainColor],
              [mainColor],
              [mainColor]
            ],
            activeFgColor: Colors.black,
            inactiveBgColor: Colors.white,
            inactiveFgColor: Colors.black,
            totalSwitches: 3,
            icons: [
              Icons.delivery_dining,
              Icons.shopping_bag,
              Icons.dining_outlined
            ],
            initialLabelIndex: 1,
            onToggle: (index) {
              Provider.of<CardProvider>(context,listen: false).currentIndexOfToggle = index!;
              },
          ),
        ),
      ),
    );
  }
}
