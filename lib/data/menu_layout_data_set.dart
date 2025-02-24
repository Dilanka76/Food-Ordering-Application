import 'package:food_ordering_application/data/main_data_set.dart';

import '../models/menu_layout_data_model.dart';

class MenuLayoutDataSetDataSet {
  final List<MenuScreenData> menuScreenDataSet = [];
  setData() {
    for (dynamic item in mainDataSet["Result"]["Menu"]) {
      menuScreenDataSet.add(
        MenuScreenData(
          title: item["Title"]["en"],
          id: item["ID"],
          menuId: item["MenuID"],
        ),
      );
    }
  }
}
