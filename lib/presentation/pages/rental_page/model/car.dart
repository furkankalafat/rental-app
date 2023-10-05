import 'package:json_annotation/json_annotation.dart';
import 'package:rental_app/core/base/model/base_model.dart';
part 'car.g.dart';

@JsonSerializable()
class Car extends BaseModel {
  final String? brand;
  final String? model;
  final String? price;
  final String? location;
  final String? gear;
  final bool? isAvailable;

  Car({
    this.brand,
    this.model,
    this.price,
    this.location,
    this.gear,
    this.isAvailable,
  });
  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CarToJson(this);
}
