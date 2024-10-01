import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopCarouselWidget extends StatelessWidget {
  const TopCarouselWidget({
    super.key,
    required this.h,
    required this.w,
    required this.s,
    required this.m,
  });

  final double h;
  final double w;
  final ShapeBorder s;
  final EdgeInsets m;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      child: Container(
        margin: m,
        child: CarouselView(
            onTap: (value) => Get.toNamed('/recipePage'),
            shape: s,
            backgroundColor: Colors.white,
            elevation: 0.4,
            itemExtent: w,
            children: [
              Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Icon(Icons.free_breakfast_rounded),
                    Text("Coffee/Tea")
                  ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.local_dining_sharp),
                Text("Breakfast")
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.table_bar),
                Text("Lunch")
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.fastfood_rounded),
                Text("Snacks")
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.ramen_dining_rounded),
                Text("Dinner")
              ])),
              Container(
                  child: Column(children: [
                SizedBox(
                  height: 8,
                ),
                Icon(Icons.local_bar_rounded),
                Text("Drinks")
              ])),
            ]),
      ),
    );
  }
}
