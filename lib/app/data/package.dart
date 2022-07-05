import 'package:json_annotation/json_annotation.dart';
part 'package.g.dart';

@JsonSerializable()
class PackageModel {
  PackageModel({required this.name, required this.price, required this.currency, required this.coins});

  String name;
  int price;
  String currency;
  int coins;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory PackageModel.fromJson(Map<String, dynamic> json) => _$PackageModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PackageModelToJson(this);
}
