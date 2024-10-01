import 'package:image_picker/image_picker.dart';
import 'package:food_recipe_app/controllers/firestoreController.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Imagepickers {
  Future<List<String>> pickImage(String fName) async {
    List<String> imageUrls = [];
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(imageQuality: 50);
    for (var image in images) {
      String downloadURLs = await FirebaseServices().uplodImages(image, fName);
      imageUrls.add(downloadURLs);
      print(downloadURLs);
    }
    return imageUrls;
  }
}
