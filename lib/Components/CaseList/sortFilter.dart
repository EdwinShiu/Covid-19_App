
import 'package:flutter/cupertino.dart';

enum SortingOrder {ascending, descending}

enum FilterOrder {showAll, show100}

class SortFilter extends ChangeNotifier {
  
  SortingOrder _sortingOrder = SortingOrder.descending;
  FilterOrder _filterOrder = FilterOrder.showAll;

  SortingOrder get sortingOrder => _sortingOrder;

  set sortingOrder(SortingOrder order) {
    _sortingOrder = order;
    notifyListeners();
  }

  FilterOrder get filterOrder => _filterOrder;

  set filterOrder(FilterOrder order) {
    _filterOrder = order;
    notifyListeners();
  }
}

class ListPage extends ChangeNotifier{
  int _page; //
  int _maxPage;

  ListPage(int numberOfCases) {
    _maxPage = (numberOfCases / 100).floor();
    _page = 0;
  }

  int get getPage => _page;

  int get getMaxPage => _maxPage;

  set setPage(int page) {
    _page = page;
    notifyListeners();
  }

  void setMax() {
    _page = _maxPage;
    notifyListeners();
  }

  void increasePage() {
    if (_page < _maxPage) {
      _page++;
      notifyListeners();
    }
  }

  void decreasePage() {
    if (_page > 0) {
      _page--;
      notifyListeners();
    }
  }
}