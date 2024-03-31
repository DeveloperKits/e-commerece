import 'package:ecommerece/model/category_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@unfreezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    String? productId,
    String? description,
    required String productName,
    required String imageUrl,
    required double price,
    required num stock,
    required CategoryModel category,
    @Default(0) num discount,
    @Default(false) bool featured,
    @Default(0.0) double rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
}