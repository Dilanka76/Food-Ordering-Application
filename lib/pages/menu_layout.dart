import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import '../models/menu_layout_data_model.dart';
import 'category_page.dart';

class MenuLayout extends StatefulWidget {
  List<MenuScreenData> menuDataList = [];
  MenuLayout({super.key, required this.menuDataList});

  @override
  State<MenuLayout> createState() => _MenuLayoutState();
}

class _MenuLayoutState extends State<MenuLayout> {
  String selectedValue = "";
  String selectedMenuDataId = "";
  String selectedMenuTitle = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.62,
          child: ListView.builder(
            itemCount: widget.menuDataList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              MenuScreenData menuData = widget.menuDataList[index];
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${menuData.title}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: mainColor),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  selectedMenuDataId = menuData.menuId;
                  selectedMenuTitle = menuData.title;
                  menuSelectedBtn();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  menuSelectedBtn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => CategoryPage(
              selectedMenuDataId: selectedMenuDataId,
              selectedMenuTitle: selectedMenuTitle,
            ),
      ),
    ).then((value) {
      setState(() {
        selectedValue = "";
      });
    });
  }
}
