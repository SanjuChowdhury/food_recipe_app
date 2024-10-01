import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/carouselWidget.dart';
import 'package:food_recipe_app/dataModel/dummyModel.dart';
import 'package:food_recipe_app/dataProvider/mainProvider.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class FoodRecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final foodName = Get.parameters['foodName'];
    final foodType = Get.parameters['foodType'];
    final description = Get.parameters['description'];
    final foodImages = jsonDecode(Get.parameters['foodImages']!);
    final author = Get.parameters['author'];
    final reviews = Get.parameters['reviews'];
    final steps = jsonDecode(Get.parameters['steps']!);

    List<Widget> addImage() {
      List<Widget> mywidegtList = [];
      for (String img in foodImages) {
        mywidegtList.add(Image.network(img));
      }
      return mywidegtList;
    }

    ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CarouselWidget(
            h: size.height * 0.40,
            w: size.width,
            s: InputBorder.none,
            m: const EdgeInsets.all(0),
            lst: addImage(),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.65, // Start from half of the screen
            minChildSize:
                0.65, // Minimum size when collapsed (prevents full collapse)
            maxChildSize: 0.80, // Maximum size when expanded
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: size.height * 0.03),
                        SizedBox(
                          height: size.height * 0.16,
                          width: size.width * .90,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  foodName!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  " ${foodType!}",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                                const SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.account_circle),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(author!)
                                  ],
                                )
                              ]),
                        ),
                        SizedBox(height: size.height * 0.03),
                        SizedBox(
                          height: size.height * 0.05,
                          width: size.width * .90,
                          child: const Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * .83,
                          child: Text(description!),
                        )
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
