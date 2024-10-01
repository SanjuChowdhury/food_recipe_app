import 'package:flutter/material.dart';
import 'package:food_recipe_app/dataModel/dummyModel.dart';

class Mainprovider extends ChangeNotifier {
  Mainprovider();
  List<Dummymodel> dummyData = [
    Dummymodel(
        foodName: 'Veg-Sandwitch',
        foodType: 'Breakfast',
        foodImages: [
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a",
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a",
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a"
        ],
        description:
            'This veg sandwich or vegetable sandwich is one of the easiest sandwich recipes I have made so far. This can be one of the ideal lunch box recipes for kids and office goers too.Easy vegetable sandwich with onion,carrot and capsicum filling, it can be made in just few minutes.',
        author: 'admin',
        reviews: 4.5,
        steps: [
          'aavaavajvvsvdAHSDVDV',
          'BXbH XHDhvdhvdhvdHVDad',
          'SVhbxbAWYBBXHAVDAD'
        ]),
    Dummymodel(
        foodName: 'Veg-Manchurian',
        foodType: 'Snacks',
        foodImages: [
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Veg%20Sandwitch_images%2F1724856277911900?alt=media&token=908e1751-3f27-458a-af57-b7bb6f86ec62",
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Veg%20Sandwitch_images%2F1724856280663978?alt=media&token=50a73373-1e87-41a2-8113-c78a09c7722c"
        ],
        description: 'ssgsgsgsvssdvsvsvsdvssvsssvsdssssvvz€szzsvvs',
        author: 'admin',
        reviews: 4,
        steps: [
          'aavaavajvvsvdAHSDVDV',
          'BXbH XHDhvdhvdhvdHVDad',
          'SVhbxbAWYBBXHAVDAD'
        ]),
    Dummymodel(
        foodName: 'Chilli-Chicken',
        foodType: 'Dinner',
        foodImages: [
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a",
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a",
          "https://firebasestorage.googleapis.com/v0/b/cookbook-42f8f.appspot.com/o/Black%20Tea_images%2F1724854894712763?alt=media&token=8e904328-8ba7-4a4c-9ba3-e6ef4a09200a"
        ],
        description: 'ssgsgsgsvssdvsvsvsdvssvsssvsdssssvvz€szzsvvs',
        author: 'admin',
        reviews: 4.2,
        steps: [
          'aavaavajvvsvdAHSDVDV',
          'BXbH XHDhvdhvdhvdHVDad',
          'SVhbxbAWYBBXHAVDAD'
        ])
  ];
}
