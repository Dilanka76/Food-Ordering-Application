import 'package:flutter/material.dart';

class IsDaelProTag extends StatefulWidget {
  const IsDaelProTag({super.key});

  @override
  State<IsDaelProTag> createState() => _IsDaelProTagState();
}

class _IsDaelProTagState extends State<IsDaelProTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "Item Is a Deal ",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
