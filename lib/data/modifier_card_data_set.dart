import 'package:food_ordering_application/data/main_data_set.dart';
import 'package:food_ordering_application/models/modifier_card_data_model.dart';

class ModifiersDataSet {
  List<ModifiersData> modifiersDataList = [];

  setData() {
    for (dynamic item in mainDataSet["Result"]["ModifierGroups"]) {
      modifiersDataList.add(
        ModifiersData(
          modifiersGroupId: item["ModifierGroupID"],
          modifiersTitle: item["Title"]["en"],
          modifiersDescription: item["Description"]["en"],
          modifierOprionsList: item["ModifierOptions"],
          QuantityConstraintsRules: item["QuantityConstraintsRules"],
        ),
      );
    }
  }
}
