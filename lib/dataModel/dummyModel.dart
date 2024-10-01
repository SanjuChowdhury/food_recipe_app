import 'package:flutter/material.dart';

class Dummymodel {
  Dummymodel(
      {required this.foodName,
      required this.foodType,
      required this.foodImages,
      required this.description,
      required this.author,
      required this.reviews,
      required this.steps});
  String foodType;
  List<dynamic> foodImages = [];
  String foodName;
  String description;
  List<dynamic> steps = [];
  String author;
  double reviews;

  List<dynamic> getImages() {
    return foodImages;
  }
}
