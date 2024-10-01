import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Foodmodel {
  Foodmodel({
    required this.foodType,
    required this.foodImages,
    required this.foodName,
    required this.description,
    this.reviews = 0.0,
    required this.steps,
    this.author = 'admin',
  });
  String foodType;
  List<dynamic> foodImages;
  String foodName;
  String description;
  List<dynamic> steps;
  String author;
  double reviews;

  Map<String, dynamic> toMap() {
    return {
      "foodType": foodType,
      "foodName": foodName,
      "foodImages": foodImages,
      "desciption": description,
      "steps": steps,
      "author": author,
      "reviews": reviews,
    };
  }

  factory Foodmodel.fromMap(Map<String, dynamic> map) {
    return Foodmodel(
        foodType: map["foodType"],
        foodImages: map["foodImages"],
        foodName: map["foodName"],
        description: map["desciption"],
        reviews: map["reviews"],
        steps: map["steps"],
        author: map["author"]);
  }
}
