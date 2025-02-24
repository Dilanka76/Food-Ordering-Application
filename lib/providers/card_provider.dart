import 'package:flutter/cupertino.dart';
import 'package:food_ordering_application/data/category_data_set.dart';
import '../models/category_data_model.dart';
import '../models/proceed_item_model.dart';

class CardProvider with ChangeNotifier {

  //basket count increament
  int _countBasket = 0;
  int get countBasket => _countBasket;
  set countBasket(int value) {
    _countBasket = value;
    notifyListeners();
  }

  //basket count decrement
  double _totalAddPrice = 0.0;
  double get totalAddPrice => _totalAddPrice;
  set totalAddPrice(double value) {
    _totalAddPrice = value;
    notifyListeners();
  }

  //view basket list
  List<CategoryData> _addedBasketCateIdList = [];
  List<CategoryData> get addedBasketCateIdList => _addedBasketCateIdList;
  set addedBasketCateIdList(List<CategoryData> value) {
    _addedBasketCateIdList = value;
    notifyListeners();
  }

  //proceed order  list

  List<ProceedItemsData> _proceedOrderList =[];
  List<ProceedItemsData> get proceedOrderList => _proceedOrderList;
  set proceedOrderList(List<ProceedItemsData> value) {
    _proceedOrderList = value;
    notifyListeners();
  }

  //toggleswitch button current index;
  int _currentIndexOfToggle = 1;
  int get currentIndexOfToggle => _currentIndexOfToggle;
  set currentIndexOfToggle(int index){
    _currentIndexOfToggle = index;
    notifyListeners();
  }


  //methods
  void increment() {
    _countBasket++;
    notifyListeners();
  }

  void decrement() {
    _countBasket--;
    notifyListeners();
  }

  void setBasketCateListData(String addBasketCategoryIds) {
    CategoryDataSet categoryDataSet = CategoryDataSet();
    categoryDataSet.setData();
    for (CategoryData item in categoryDataSet.categoryDataSet) {
      if (item.cId == addBasketCategoryIds) {
        _addedBasketCateIdList.add(
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

  void removeBasketCateListData(String addBasketCategoryIds) {
    _addedBasketCateIdList.removeWhere((e) => e.cId == addBasketCategoryIds);
  }
}
