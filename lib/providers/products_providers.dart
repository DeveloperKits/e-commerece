import 'package:flutter/foundation.dart';

import '../model/category_model.dart';

class ProductsProvider extends ChangeNotifier{
  List<CategoryModel> categoryList = [];
}