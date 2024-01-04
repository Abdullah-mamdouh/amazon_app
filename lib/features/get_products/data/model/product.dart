
import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  @JsonKey(name: 'rating')
  Rating? rating;

  Product({this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}


@JsonSerializable()
class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);
}