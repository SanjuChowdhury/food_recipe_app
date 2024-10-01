import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/imagePicker.dart';
import 'package:food_recipe_app/controllers/firestoreController.dart';
import 'package:food_recipe_app/dataModel/foodModel.dart';
import 'package:get/get.dart';

//ADMIN Route
class CreateContentScreen extends StatelessWidget {
  TextEditingController tc = TextEditingController();
  List<Widget> containers = <Widget>[].obs;

  List<dynamic> foodImages = [];
  RxString foodName = ''.obs;
  RxString description = ''.obs;
  List<String> steps = <String>[].obs;
  List<TextEditingController> tecList = <TextEditingController>[].obs;
  List<String> foodType = <String>['Food Type'].obs;

  void getNewTEC() {
    tecList.add(TextEditingController());
    steps.add('');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List<DropdownMenuItem<String>> _dropdownList = [
      DropdownMenuItem(value: 'Tea/Coffee', child: Text('Tea/Coffee')),
      DropdownMenuItem(value: 'Breakfast', child: Text('Breakfast')),
      DropdownMenuItem(value: 'Lunch', child: Text('Lunch')),
      DropdownMenuItem(value: 'Dinner', child: Text('Dinner')),
      DropdownMenuItem(value: 'Snacks', child: Text('Snacks')),
      DropdownMenuItem(value: 'Drinks', child: Text('Drinks')),
    ];
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: size.width * 0.30,
                    height: size.height * 0.10,
                    child: Obx(
                      () => DropdownButton<String>(
                          hint: Text(foodType[foodType.length - 1]),
                          items: _dropdownList,
                          onChanged: (val) {
                            foodType.add(val!);
                          }),
                    )),
                SizedBox(
                  width: size.width * 0.60,
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onSubmitted: (value) {
                      foodName.value = value;
                    },
                    decoration: InputDecoration(
                        hintText: "Recipe name....",
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
            SizedBox(
                height: size.height * .10,
                child: IconButton(
                    onPressed: () async {
                      foodImages =
                          await Imagepickers().pickImage(foodName.value);
                    },
                    icon: Icon(
                      Icons.photo_camera_sharp,
                      size: 50,
                    ))),
            SizedBox(
              width: size.width * 0.80,
              child: TextField(
                onSubmitted: (value) {
                  description.value = value;
                },
                keyboardType: TextInputType.text,
                maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                    hintText: "Description", border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: size.height * .05,
            ),
            SizedBox(
                height: size.height * .07,
                width: size.width * 0.60,
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        getNewTEC();
                      },
                      child: Text(
                        "Add Steps...",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: size.width * 0.15,
                      child: IconButton(
                        onPressed: () async {
                          var data = await FirebaseServices().getData();
                          for (var d in data) {
                            print(d.foodImages);
                          }
                        },
                        icon: Icon(Icons.remove),
                        style:
                            IconButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: size.height * .05,
            ),
            Obx(
              () => SizedBox(
                width: size.width * .80,
                height: size.height * .40,
                child: ListView.builder(
                    itemCount: tecList.length,
                    itemBuilder: (context, index) {
                      return getMyTextfield(index, tecList[index], size);
                    }),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
                width: size.width * 0.80,
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseServices().addData(Foodmodel(
                      foodType: foodType[foodType.length - 1],
                      foodImages: foodImages,
                      foodName: foodName.value,
                      description: description.value,
                      steps: steps,
                    ));
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                ))
          ],
        ),
      ),
    ));
  }

  Widget getMyTextfield(int n, TextEditingController controller, Size size) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: SizedBox(
            width: size.width * 0.80,
            child: TextField(
              keyboardType: TextInputType.text,
              maxLines: null,
              minLines: 1,
              controller: controller,
              onSubmitted: (value) {
                steps[n] = controller.text;
                print(steps);
              },
              decoration: InputDecoration(
                  hintText: "What's now.....", border: OutlineInputBorder()),
            ),
          ),
        ),
      ],
    );
  }
}
