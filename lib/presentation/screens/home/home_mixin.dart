import 'package:example/presentation/screens/home/home_page.dart';
import 'package:flutter/material.dart';

mixin HomeMixin on State<HomePage> {
  final List<String> category = [
    "Ramazan",
    "Pizza",
    "Deals",
    "Snacks",
    "Dessert",
    "Milkshakes",
    "Coffee",
    "Sauces",
  ];
  final ScrollController scrollController = ScrollController();

  int selectedCategoryIndex = 0;
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      selectedCategoryIndex =
          ((scrollController.offset / MediaQuery.of(context).size.width)
              .floor());
    });
  }
}
