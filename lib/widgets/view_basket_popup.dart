import 'package:flutter/material.dart';
import 'package:food_ordering_application/models/category_data_model.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';
import '../pages/menu_items_page.dart';

class ViewBasketPopup extends StatefulWidget {
  const ViewBasketPopup({super.key});

  @override
  State<ViewBasketPopup> createState() => _ViewBasketPopupState();
}

class _ViewBasketPopupState extends State<ViewBasketPopup> {
  @override
  Widget build(BuildContext context) {
    final viewBasketProvide = Provider.of<CardProvider>(context);
    return Container(
      width: double.infinity,
      height: 500,
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Basket List", style: mainTopicSize),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.695,
          width: 500,
          child: ListView.builder(
            itemCount: viewBasketProvide.addedBasketCateIdList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              // CategoryData  categoryData = selectedCategoryList[index];
              CategoryData viewBasketCData = viewBasketProvide.addedBasketCateIdList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
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
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                                  width: 50,
                                  child: ClipRect(
                                    child: Image.network(
                                      "${viewBasketCData.imageUrl}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${viewBasketCData.cId.split('-').last.trim()}",
                                        style: normalSize,
                                      ),
                                      Text(
                                        "Rs ${viewBasketProvide.currentIndexOfToggle == 0 ? viewBasketCData.DeliveryPrice.toString():
                                        viewBasketProvide.currentIndexOfToggle == 1 ? viewBasketCData.pickedPrice.toString():
                                        viewBasketCData.tablePrice.toString()
                                          }",
                                        style: TextStyle(
                                          color: mainColor,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 7, 0, 0,),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: mainColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => MenuItemsPage(
                                    selectedCategoryMenuItemprice: viewBasketProvide.currentIndexOfToggle == 0 ? viewBasketCData.DeliveryPrice:
                                    viewBasketProvide.currentIndexOfToggle == 1 ? viewBasketCData.pickedPrice:
                                    viewBasketCData.tablePrice,
                                    selectedCatergoryMenuItemName: viewBasketCData.cId.split('-').last.trim(),
                                    selectedCatergoryDataId: viewBasketCData.cId,
                                    isviewBasket:true,
                                  ),
                            ),
                          ).then((value) {
                            setState(() {});
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
