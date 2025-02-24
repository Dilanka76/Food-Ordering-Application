import 'package:flutter/material.dart';
import 'package:food_ordering_application/models/proceed_item_model.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:provider/provider.dart';
import '../constant/colors_padding_sizes.dart';

class ViewShopingCartPopup extends StatefulWidget {
  const ViewShopingCartPopup({super.key});

  @override
  State<ViewShopingCartPopup> createState() => _ViewShopingCartPopupState();
}

class _ViewShopingCartPopupState extends State<ViewShopingCartPopup> {
  @override
  Widget build(BuildContext context) {
    final viewShopingCartList = Provider.of<CardProvider>(context);
    return Container(
      width: double.infinity,
      height: 500,
      child: AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Proceed Order", style: mainTopicSize),
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
            itemCount: viewShopingCartList.proceedOrderList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              // CategoryData  categoryData = selectedCategoryList[index];
              ProceedItemsData viewShopingCData =
                  viewShopingCartList.proceedOrderList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
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
                                    "${viewShopingCData.imageUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${viewShopingCData.itemName}",
                                      style: normalSize,
                                    ),
                                    Text(
                                      "Rs ",
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                                child: Column(
                                  children: [
                                    Text("Qty", style: mainTopicSize),
                                    Text(
                                      "${viewShopingCData.itemcount}",
                                      style: mainTopicSize,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Center(
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.red,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Circular border
                        ),
                      ),
                      onPressed: () async {
                        viewShopingCartList.proceedOrderList = [];
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("UnSuccessfull"),
                              content: Text("Your order has been Canceled !"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("Cancel ", style: mainTopicSize),
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: mainColor,
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // Circular border
                        ),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        viewShopingCartList.proceedOrderList = [];
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Successfull"),
                              content: Text("Your order has been placed !"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text("Confirmed", style: mainTopicSize),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
