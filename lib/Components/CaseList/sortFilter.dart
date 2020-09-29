
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