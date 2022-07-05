// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) => TransactionModel(
      name: json['name'] as String,
      price: json['price'] as int,
      currency: json['currency'] as String,
      coins: json['coins'] as int,
      date: json['date'] as int,
      state: json['state'] as String,
      expireDate: json['expireDate'] as int,
      totalCoins: json['totalCoins'] as int,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'currency': instance.currency,
      'totalCoins': instance.totalCoins,
      'coins': instance.coins,
      'date': instance.date,
      'expireDate': instance.expireDate,
      'state': instance.state,
    };
