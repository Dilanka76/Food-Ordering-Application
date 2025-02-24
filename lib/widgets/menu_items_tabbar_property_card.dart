import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';

class MenuItemsTabbarPropertyCard extends StatefulWidget {
  const MenuItemsTabbarPropertyCard({super.key});

  @override
  State<MenuItemsTabbarPropertyCard> createState() =>
      _MenuItemsTabbarPropertyCardState();
}

class _MenuItemsTabbarPropertyCardState
    extends State<MenuItemsTabbarPropertyCard>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: TabBar(
              isScrollable: true,
              labelColor: mainColor,
              tabs: [
                Tab(child: Text("Ingredients", style: mainTopicSize)),
                Tab(child: Text("Nutritional", style: mainTopicSize)),
                Tab(child: Text("Instructions", style: mainTopicSize)),
                Tab(child: Text("Allow", style: mainTopicSize)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alterame form, by injected humour, or randomised words which don't look even slightly believable.",
                          style: normalSize,
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text("Eggs", style: normalSize),
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text("Fish", style: normalSize),
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text("Milk", style: normalSize),
                              ),
                            ),
                            SizedBox(width: 2),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text("Gluten", style: normalSize),
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "See more..",
                              style: TextStyle(color: mainColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nutritional value per 100g",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "198",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("Kcal", style: normalSize),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "14.1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("Protiens", style: normalSize),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "19.6",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("Fats", style: normalSize),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "6.6",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text("CarboH", style: normalSize),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(child: Text("")),
              Center(child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}
