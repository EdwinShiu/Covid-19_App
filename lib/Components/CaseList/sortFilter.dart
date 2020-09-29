import 'package:flutter/material.dart';

enum SortingOrder {ascending, descending}

enum FilterOrder {showAll, show100}

class SortFilter {
  
  SortingOrder sortingOrder = SortingOrder.ascending;
  FilterOrder filterOrder = FilterOrder.showAll;
}