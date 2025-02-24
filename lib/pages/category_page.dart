
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/category_data_set.dart';
import '../providers/card_provider.dart';
import '../widgets/view_shoping_card.dart';
import 'category_layout.dart';

class CategoryPage extends StatefulWidget {
  final String selectedMenuDataId;
  final String selectedMenuTitle;
  const CategoryPage({
    super.key,
    required this.selectedMenuDataId,
    required this.selectedMenuTitle,
  });
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    CategoryDataSet listOfCatergoryData = CategoryDataSet();
    // get the relavent categoryData
    listOfCatergoryData.setData();

    final categoryDataList = listOfCatergoryData.categoryDataSet;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            Provider.of<CardProvider>(context, listen: false).countBasket = 0;
            Provider.of<CardProvider>(context, listen: false).totalAddPrice = 0;
            Provider.of<CardProvider>(context, listen: false)
                .addedBasketCateIdList = [];
          },
          icon: Icon(Icons.close),
        ),
        title: ViewShopingCart(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryLayout(
              categoryDataList: categoryDataList,
              selectedmenuDataId: widget.selectedMenuDataId,
              selectedmenuTitle: widget.selectedMenuTitle,
            ),
          ],
        ),
      ),
    );
  }
}
