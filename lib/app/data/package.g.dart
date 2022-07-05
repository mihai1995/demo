// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageModel _$PackageModelFromJson(Map<String, dynamic> json) => PackageModel(
      name: json['name'] as String,
      price: json['price'] as int,
      currency: json['currency'] as String,
      coins: json['coins'] as int,
    );

Map<String, dynamic> _$PackageModelToJson(PackageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'coins': instance.coins,
    };
