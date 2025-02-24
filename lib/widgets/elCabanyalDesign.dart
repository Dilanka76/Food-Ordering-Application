import 'package:flutter/material.dart';
import 'package:food_ordering_application/widgets/view_shoping_card.dart';

class Elcabanyaldesign extends StatefulWidget {
  final String mainImageTopic;
  final String imageUrl;
  const Elcabanyaldesign({
    super.key,
    required this.mainImageTopic,
    required this.imageUrl,
  });

  @override
  State<Elcabanyaldesign> createState() => _ElcabanyaldesignState();
}

class _ElcabanyaldesignState extends State<Elcabanyaldesign> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRect(
          child: Image.network(
            widget.imageUrl,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                ViewShopingCart(),
                Text(
                  "EL Cabanyal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Welcome to the FastFood Service",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  widget.mainImageTopic,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
