import 'package:flutter/material.dart';
import 'package:food_ordering_application/data/menu_items_data_set.dart';
import 'package:food_ordering_application/models/menu_items_model.dart';
import '../widgets/add_to_cart.dart';
import '../widgets/menu_items_description_card.dart';
import '../widgets/menu_items_tabbar_property_card.dart';
import '../widgets/modifier_card.dart';
import '../widgets/view_shoping_card.dart';

class MenuItemsPage extends StatefulWidget {
  final String selectedCatergoryDataId;
  final String selectedCatergoryMenuItemName;
  final double selectedCategoryMenuItemprice;
  final bool isviewBasket;
   const MenuItemsPage({
    super.key,
    required this.selectedCatergoryMenuItemName,
    required this.selectedCatergoryDataId,
    required this.selectedCategoryMenuItemprice,
    required this.isviewBasket,
  });

  @override
  State<MenuItemsPage> createState() => _MenuItemsPageState();
}

class _MenuItemsPageState extends State<MenuItemsPage> {
  List<MenuItemsData> filteredMenuItemDataList = [];
  @override
  void initState() {
    getMenuItemDataSet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if(widget.isviewBasket){
              Navigator.pop(context);
              Navigator.pop(context);

            }else{
              Navigator.pop(context);
            }
          },
          icon: Icon(Icons.close),
        ),
        title: ViewShopingCart(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuItemDescCard(
              selectedCatergoryMenuItemName: widget.selectedCatergoryMenuItemName,
              selectedCategoryMenuItemprice: widget.selectedCategoryMenuItemprice,
              selectedMenuItemDataset: filteredMenuItemDataList,
            ),
            MenuItemsTabbarPropertyCard(),
            Padding(padding: const EdgeInsets.all(10.0), child: Divider()),
            ModifierCards(selectedMenuItemDataset: filteredMenuItemDataList),
            AddToCartCard(selectedMenuItemDataset:filteredMenuItemDataList),
          ],
        ),
      ),
    );
  }

  //get relavant data to Menu Item When selected Category

  getMenuItemDataSet() {
    MenuItemsDataSet menuItemDataSet = MenuItemsDataSet();
    menuItemDataSet.setData();

    for (MenuItemsData item in menuItemDataSet.menuItemsDataSet) {
      if (item.menuItemId == widget.selectedCatergoryDataId) {
        filteredMenuItemDataList.add(
          MenuItemsData(
            menuItemId: item.menuItemId,
            title: item.title,
            description: item.description,
            imageUrl: item.imageUrl,
            deliveryprice: item.deliveryprice,
            pickupPrice: item.pickupPrice,
            tablePrice: item.tablePrice,
            isDealProduct: item.isDealProduct,
            ModifierGroupRulesIds: item.ModifierGroupRulesIds,
          ),
        );
      }
    }
  }
}
