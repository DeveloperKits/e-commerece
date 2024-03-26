
import 'package:ecommerece/pages/category.dart';
import 'package:ecommerece/pages/new_products.dart';
import 'package:ecommerece/pages/view_products.dart';
import 'package:flutter/material.dart';

class DashboardItem{
  String tittle;
  String route;
  IconData iconData;

  DashboardItem({
    required this.tittle,
    required this.route,
    required this.iconData,
  });
}

final dashboardItemList = <DashboardItem>[
  DashboardItem(tittle: "Add Product", route: NewProductsPage.routeName, iconData: Icons.add),
  DashboardItem(tittle: "View Product", route: ViewProductPage.routeName, iconData: Icons.card_giftcard),
  DashboardItem(tittle: "Category", route: CategoryPage.routeName, iconData: Icons.category),
];
