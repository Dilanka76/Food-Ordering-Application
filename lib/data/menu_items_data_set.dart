import 'package:food_ordering_application/data/main_data_set.dart';
import 'package:food_ordering_application/models/menu_items_model.dart';

class MenuItemsDataSet {
  List<MenuItemsData> menuItemsDataSet = [];

  setData() {
    for (dynamic item in mainDataSet["Result"]["Items"]) {
      menuItemsDataSet.add(
        MenuItemsData(
          menuItemId: item["MenuItemID"],
          title: item["Title"]["en"],
          description: item["Description"]["en"],
          imageUrl: item["ImageURL"],
          deliveryprice: double.parse(item["PriceInfo"]["Price"]["DeliveryPrice"].toString(),),
          pickupPrice: double.parse(item["PriceInfo"]["Price"]["PickupPrice"].toString(),),
          tablePrice: double.parse(item["PriceInfo"]["Price"]["TablePrice"].toString(),),
          isDealProduct: item["MetaData"]["IsDealProduct"] ?? false,
          ModifierGroupRulesIds: item["ModifierGroupRules"]["IDs"] ?? [],
        ),
      );
    }
  }
}
