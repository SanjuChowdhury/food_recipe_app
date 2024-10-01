import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/dataModel/dummyModel.dart';
import 'package:food_recipe_app/screens/foodRecipeScreen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:food_recipe_app/dataProvider/mainProvider.dart';

class CarouselWidget extends StatelessWidget {
  CarouselWidget({
    required this.h,
    required this.w,
    required this.s,
    required this.m,
    required this.lst,
  });
  static List<Dummymodel>? selectedObj;
  static selectMyObj(List<Dummymodel> objs) {
    selectedObj = objs;
  }

  final double h;
  final double w;
  final ShapeBorder s;
  final EdgeInsets m;
  final List<Widget> lst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: Container(
        margin: m,
        child: CarouselView(
            onTap: (index) {
              Get.toNamed("/recipePage", parameters: {
                'foodName': selectedObj![index].foodName,
                'foodType': selectedObj![index].foodType,
                'foodImages': jsonEncode(selectedObj![index].foodImages),
                'description': selectedObj![index].description,
                'author': selectedObj![index].author,
                'reviews': jsonEncode(selectedObj![index].reviews),
                'steps': jsonEncode(selectedObj![index].steps)
              });
            },
            shape: s,
            backgroundColor: Colors.white,
            elevation: 0.4,
            itemExtent: w,
            children: lst),
      ),
    );
  }
}
