import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_recipe_app/dataModel/foodModel.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseServices {
  FirebaseFirestore fireStoreInstance = FirebaseFirestore.instance;
  Future<void> addData(Foodmodel food) async {
    await fireStoreInstance
        .collection('Recipes')
        .doc(food.foodName)
        .set(food.toMap());
  }

  Future<List<Foodmodel>> getData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await fireStoreInstance.collection('Recipes').get();

      return querySnapshot.docs
          .map((doc) => Foodmodel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> uplodImages(XFile image, String fName) async {
    try {
      //identifying the image file
      File file = File(image.path);
//creating a reference
      final storage = FirebaseStorage.instance;
      Reference ref = storage
          .ref()
          .child("${fName}_images/${DateTime.now().microsecondsSinceEpoch}");
//uploading the file in firebase storage
      await ref.putFile(file);
//getting the download url for API use
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      return e.toString();
    }
  }
}
