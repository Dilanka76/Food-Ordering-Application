import 'package:flutter/material.dart';
import 'package:food_ordering_application/constant/colors_padding_sizes.dart';
import 'package:food_ordering_application/providers/card_provider.dart';
import 'package:provider/provider.dart';
import '../models/category_data_model.dart';
import '../widgets/add_to_basket_btn.dart';
import '../widgets/view_basket_popup.dart';
import 'menu_items_page.dart';

class CategoryLayout extends StatefulWidget {
  List<CategoryData> categoryDataList = [];
  final String selectedmenuDataId;
  final String selectedmenuTitle;
  CategoryLayout({
    super.key,
    required this.categoryDataList,
    required this.selectedmenuDataId,
    required this.selectedmenuTitle,
  });

  @override
  State<CategoryLayout> createState() => _CategoryLayoutState();
}

class _CategoryLayoutState extends State<CategoryLayout> {
  List<CategoryData> selectedCategoryList = [];
  int basketCount = 0;
  double totalAddBasketPrice = 0.0;

  List<CategoryData> viewBasketCategoryList = [];
  @override
  void initState() {
    filterSelectedCatergoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewBasketProvide = Provider.of<CardProvider>(context);
    basketCount = Provider.of<CardProvider>(context).countBasket;
    totalAddBasketPrice = Provider.of<CardProvider>(context).totalAddPrice;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("${widget.selectedmenuTitle}", style: mainTopicSize),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.695,
          child: ListView.builder(
            itemCount: selectedCategoryList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              CategoryData categoryData = selectedCategoryList[index];
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
                                      "${categoryData.imageUrl}",
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
                                        "${categoryData.cId.split('-').last.trim()}",
                                        style: normalSize,
                                      ),
                                      Text(
                                        "Rs ${viewBasketProvide.currentIndexOfToggle == 0 ? categoryData.DeliveryPrice.toString():
                                        viewBasketProvide.currentIndexOfToggle == 1 ? categoryData.pickedPrice.toString():
                                        categoryData.tablePrice.toString()
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
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 25,),
                                  child: AddToBasketBtn(
                                    addBasketCatergotyPrice: viewBasketProvide.currentIndexOfToggle == 0 ? categoryData.DeliveryPrice:
                                    viewBasketProvide.currentIndexOfToggle == 1 ? categoryData.pickedPrice:
                                    categoryData.tablePrice,
                                    addBasketCategoryId: categoryData.cId,
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
                                    selectedCategoryMenuItemprice: viewBasketProvide.currentIndexOfToggle == 0 ? categoryData.DeliveryPrice:
                                    viewBasketProvide.currentIndexOfToggle == 1 ? categoryData.pickedPrice:
                                    categoryData.tablePrice,
                                    selectedCatergoryMenuItemName: categoryData.cId.split('-').last.trim(),
                                    selectedCatergoryDataId: categoryData.cId,
                                    isviewBasket: false,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
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
                  onPressed: () {},
                  child: Text(
                    "Basket - $basketCount Item - Rs $totalAddBasketPrice",
                    style: mainTopicSize,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (viewBasketProvide.addedBasketCateIdList.isEmpty) {
                      return;
                    }
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return ViewBasketPopup();
                      },
                    );
                  },
                  child: Text("View Basket", style: mainTopicSize),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //filter relavant data when comes to the Menu (category Data List)
  filterSelectedCatergoryList() {
    for (CategoryData item in widget.categoryDataList) {
      if (item.menuId == widget.selectedmenuDataId) {
        selectedCategoryList!.add(
          CategoryData(
            cId: item.cId,
            menuId: item.menuId,
            imageUrl: item.imageUrl,
            DeliveryPrice: item.DeliveryPrice,
            pickedPrice: item.pickedPrice,
            tablePrice: item.tablePrice,
          ),
        );
      }
    }
  }
}
