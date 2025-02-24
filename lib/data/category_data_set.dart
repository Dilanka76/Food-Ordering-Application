import 'package:food_ordering_application/data/main_data_set.dart';

import '../models/category_data_model.dart';

class CategoryDataSet {
  final List<CategoryData> categoryDataSet = [];

  setData() {
    for (dynamic item1 in mainDataSet["Result"]["Categories"]) {
      for (dynamic item2 in item1["MenuEntities"]) {
        for (dynamic item3 in mainDataSet["Result"]["Items"]) {
          if (item2["ID"] == item3["MenuItemID"]) {
            categoryDataSet.add(
              CategoryData(
                cId: item2["ID"],
                menuId: item1["MenuID"],
                imageUrl: item3["ImageURL"],
                DeliveryPrice:double.parse(item3["PriceInfo"]["Price"]["DeliveryPrice"].toString()),
                pickedPrice: double.parse(item3["PriceInfo"]["Price"]["PickupPrice"].toString()),
                tablePrice: double.parse(item3["PriceInfo"]["Price"]["TablePrice"].toString()),
              ),
            );
          }
        }
      }
    }
  }
}
