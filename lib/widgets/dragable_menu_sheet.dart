import 'package:flutter/material.dart';
import 'package:food_ordering_application/pages/home_page.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../pages/dinner_home.dart';
import '../pages/lunch_home.dart';
import '../providers/home_page_provider.dart';

class DragbleMenulist extends StatefulWidget {
  String selectedValue;
  double minimumHeight;
  DragbleMenulist({
    super.key,
    required this.selectedValue,
    required this.minimumHeight,
  });

  @override
  State<DragbleMenulist> createState() => _DragbleMenulistState();
}

class _DragbleMenulistState extends State<DragbleMenulist> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  List sheetVal = [
    {"menuTime": "Breakfast 6am-12pm"},
    {"menuTime": "Lunch 12pm-6pm"},
    {"menuTime": "Dinner 6pm-12am"},
  ];

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<HomePageProvider>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            widget.minimumHeight -= details.primaryDelta!;
            widget.minimumHeight = widget.minimumHeight.clamp(30, 300);
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: widget.minimumHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black26)],
          ),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 5,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Time", style: mainTopicSize),
                      IconButton(
                        onPressed: () {
                          widget.minimumHeight = 30;
                          setState(() {});
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: sheetVal.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent, //
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(
                            5,
                          ), // No rounded corners
                        ),
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sheetVal[index]["menuTime"],
                                style: normalSize,
                              ),
                              Radio(
                                fillColor: MaterialStateProperty.all(mainColor),
                                value: "${sheetVal[index]["menuTime"]}",
                                groupValue: widget.selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    widget.selectedValue = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: Container(
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: mainColor,
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            await NavigateSelectTimePage(pageProvider);
                            setState(() {});
                          },
                          child: Text("Done", style: mainTopicSize),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  NavigateSelectTimePage(HomePageProvider pageProvider) {
    if (widget.selectedValue == "Breakfast 6am-12pm") {
      pageProvider.changePage(HomePage(isInitial: false));
      widget.minimumHeight = 30;
      setState(() {});
    } else if (widget.selectedValue == "Lunch 12pm-6pm") {
      pageProvider.changePage(LunchHome());
    } else {
      pageProvider.changePage(DinnerHome());
    }
  }
}
