// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      price: json['price'] as String?,
      location: json['location'] as String?,
      gear: json['gear'] as String?,
      isAvailable: json['isAvailable'] as bool?,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'model': instance.model,
      'price': instance.price,
      'location': instance.location,
      'gear': instance.gear,
      'isAvailable': instance.isAvailable,
    };
