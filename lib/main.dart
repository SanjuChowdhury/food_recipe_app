import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/dataProvider/mainProvider.dart';
import 'package:food_recipe_app/screens/createContentScreen.dart';
import 'package:food_recipe_app/screens/mainScreen.dart';
import 'package:get/get.dart';
import 'screens/foodRecipeScreen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Mainprovider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Mainscreen()),
        GetPage(name: '/recipePage', page: () => FoodRecipeScreen()),
        GetPage(
            name: '/create_content_Admin', page: () => CreateContentScreen())
      ],
    );
  }
}
