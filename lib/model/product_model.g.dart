// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      productId: json['productId'] as String?,
      description: json['description'] as String?,
      productName: json['productName'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] as num,
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      discount: json['discount'] as num? ?? 0,
      featured: json['featured'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'description': instance.description,
      'productName': instance.productName,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'stock': instance.stock,
      'category': instance.category,
      'discount': instance.discount,
      'featured': instance.featured,
      'rating': instance.rating,
    };
