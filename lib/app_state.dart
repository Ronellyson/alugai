// ignore_for_file: unnecessary_this, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  int selectedCategoryId = 0;
  String filterByDate = "";
  String filterByType = "";
  Color colorPrimary = Color(0xFFED8B4E);
  Color colorSecundary = Color(0xFFEE4D5F);

  void UpdateCategoryId(
      int selectedCategoryId, Color colorSelected, Color colorSecundary) {
    this.selectedCategoryId = selectedCategoryId;
    this.colorPrimary = colorSelected;
    this.colorSecundary = colorSecundary;
    notifyListeners();
  }

  void UpdateFilterByDate(String filterSelected) {
    this.filterByDate = filterSelected;
    notifyListeners();
  }

  void UpdateFilterByType(String filterSelected) {
    this.filterByType = filterSelected;
    notifyListeners();
  }
}
