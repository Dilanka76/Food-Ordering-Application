import 'package:flutter/cupertino.dart';
import '../pages/home_page.dart';

class HomePageProvider with ChangeNotifier {
  Widget _currentPage = HomePage(isInitial: true);

  Widget get currentPage => _currentPage;

  void changePage(newPage) {
    _currentPage = newPage;
    notifyListeners();
  }
}
