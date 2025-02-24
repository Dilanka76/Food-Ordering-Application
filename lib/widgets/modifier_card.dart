import 'dart:math' as math;
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import 'package:food_ordering_application/data/modifier_card_data_set.dart';
import 'package:food_ordering_application/models/menu_items_model.dart';
import 'package:food_ordering_application/models/modifier_card_data_model.dart';

class ModifierCards extends StatefulWidget {
  final List<MenuItemsData> selectedMenuItemDataset;
  const ModifierCards({super.key, required this.selectedMenuItemDataset});

  @override
  State<ModifierCards> createState() => _ModifierCardsState();
}

class _ModifierCardsState extends State<ModifierCards> {
  List<ModifiersData> modifiersSelectedListData = [];
  bool isSmall = false;
  bool isMedium = false;
  bool isLarge = false;

  Map<int, int> quantityCount = {};

  @override
  void initState() {
    super.initState();
    getModifiersDataSet();
  }

  @override
  Widget build(BuildContext context) {
    return modifiersSelectedListData.isNotEmpty
        ? Container(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            itemCount: modifiersSelectedListData.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ExpansionWidget(
                initiallyExpanded: true,
                titleBuilder: (
                  double animationValue,
                  _,
                  bool isExpaned,
                  toogleFunction,
                ) {
                  return InkWell(
                    onTap: () => toogleFunction(animated: true),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              modifiersSelectedListData[index].modifiersTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Transform.rotate(
                            angle: math.pi * animationValue / 2,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                content: Container(
                  height: 300,
                  child: ListView.builder(
                    itemCount:
                        modifiersSelectedListData[index]
                            .modifierOprionsList
                            .length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index2) {
                      String title =
                          modifiersSelectedListData[index]
                              .modifierOprionsList[index2]["Id"];
                      String formattedTitle = title.split("-").last.trim();

                      bool isMinPermittedOptional =
                          modifiersSelectedListData[index]
                              .QuantityConstraintsRules["Quantity"]["IsMinPermittedOptional"];

                      int mintPermitted =
                          modifiersSelectedListData[index]
                              .QuantityConstraintsRules["Quantity"]["MinPermitted"];
                      int maxntPermitted =
                          modifiersSelectedListData[index]
                              .QuantityConstraintsRules["Quantity"]["MaxPermitted"];
                      quantityCount.putIfAbsent(index2, () => 0);

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(formattedTitle, style: normalSize),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (isMinPermittedOptional &&
                                        quantityCount[index2] != 0) {
                                      quantityCount[index2] =
                                          quantityCount[index2]! - 1;
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.indeterminate_check_box,
                                    color:
                                        isMinPermittedOptional
                                            ? mainColor
                                            : Colors.grey,
                                  ),
                                ),
                                Text(
                                  quantityCount[index2].toString(),
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isMinPermittedOptional) {
                                        quantityCount.putIfAbsent(
                                          index2,
                                          () => 0,
                                        );
                                        if (quantityCount[index2] !=
                                            maxntPermitted) {
                                          quantityCount[index2] =
                                              quantityCount[index2]! + 1;
                                        }
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_box,
                                    color:
                                        isMinPermittedOptional
                                            ? mainColor
                                            : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        )
        : Container();
  }

  getModifiersDataSet() {
    ModifiersDataSet modifierDataSet = ModifiersDataSet();
    modifierDataSet.setData();
    for (ModifiersData item1 in modifierDataSet.modifiersDataList) {
      for (int i = 0; i < widget.selectedMenuItemDataset[0].ModifierGroupRulesIds.length; i++)
      {
        if (item1.modifiersGroupId == widget.selectedMenuItemDataset[0].ModifierGroupRulesIds[i]) {
          modifiersSelectedListData.add(
            ModifiersData(
              modifiersGroupId: item1.modifiersGroupId,
              modifiersTitle: item1.modifiersTitle,
              modifiersDescription: item1.modifiersDescription,
              modifierOprionsList: item1.modifierOprionsList,
              QuantityConstraintsRules: item1.QuantityConstraintsRules,
            ),
          );
        }
      }
    }
  }
}
