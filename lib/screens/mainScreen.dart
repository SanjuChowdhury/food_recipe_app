import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/components/myavatar.dart';
import 'package:food_recipe_app/components/searchBar.dart';
import 'package:food_recipe_app/components/carouselWidget.dart';
import 'package:food_recipe_app/components/topCarousel.dart';
import 'package:food_recipe_app/dataModel/dummyModel.dart';
import 'package:food_recipe_app/dataProvider/mainProvider.dart';
import 'package:food_recipe_app/screens/foodRecipeScreen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

List<Widget> rComcontainerList = [];
List<Dummymodel> rcomObjects = [];
List<Widget> pickList = [];
List<Dummymodel> pickListObjects = [];

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void recomendData() {
    for (var item in Provider.of<Mainprovider>(context).dummyData) {
      if (item.reviews > 3.5) {
        rcomObjects.add(item);
        rComcontainerList.add(CardContainer(
            foodImage: item.foodImages[0], foodName: item.foodName));
      }
    }
    CarouselWidget.selectMyObj(rcomObjects);
  }

  void bestPicks() {
    for (var item in Provider.of<Mainprovider>(context).dummyData) {
      pickListObjects.add(item);
      pickList.add(CardContainer(
          foodImage: item.foodImages[0], foodName: item.foodName));
    }
    CarouselWidget.selectMyObj(pickListObjects);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    recomendData();
    bestPicks();
  }

  Widget build(BuildContext context) {
    List<Icon> navItems = [
      const Icon(Icons.home),
      const Icon(Icons.search),
      const Icon(Icons.book_rounded),
      const Icon(Icons.account_circle),
    ];
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var orientaion = MediaQuery.of(context).orientation;
    if (height > 400 && width <= 412 && orientaion == Orientation.portrait) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: navItems,
          backgroundColor: Colors.transparent,
          height: height * 0.10,
          buttonBackgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white.withOpacity(0.95),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              UpperCompartment(width: width),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(width: width * 0.85, child: Searchbar()),
              CompartmentHeading(width: width, data: 'Categories'),
              SizedBox(
                height: 10.0,
              ),
              TopCarouselWidget(
                  h: height * 0.10,
                  w: width * 0.25,
                  s: Border.all(),
                  m: EdgeInsets.only(left: 25)),
              SizedBox(
                height: 20.0,
              ),
              CompartmentHeading(width: width, data: 'Recomendation'),
              SizedBox(
                height: 10.0,
              ),
              CarouselWidget(
                h: height * 0.25,
                w: width * 0.40,
                s: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                m: EdgeInsets.only(left: 25),
                lst: rComcontainerList,
              ),
              SizedBox(
                height: 20.0,
              ),
              CompartmentHeading(width: width, data: 'Recipes of the week'),
              SizedBox(
                height: 10.0,
              ),
              CarouselWidget(
                  h: height * 0.25,
                  w: width * 0.80,
                  s: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  m: EdgeInsets.only(left: 25),
                  lst: pickList),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        )),
      );
    } else {
      return Scaffold();
    }
  }
}

class CardContainer extends StatelessWidget {
  CardContainer({required this.foodImage, required this.foodName});
  var foodImage;
  var foodName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.network(foodImage, fit: BoxFit.fill)),
        Expanded(child: Text(foodName))
      ],
    );
  }
}

class CompartmentHeading extends StatelessWidget {
  const CompartmentHeading({
    super.key,
    required this.width,
    required this.data,
  });

  final double width;
  final String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.85,
      child: Text(
        data,
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class UpperCompartment extends StatelessWidget {
  const UpperCompartment({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width * 0.80,
          padding: EdgeInsets.symmetric(horizontal: 27.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hallo, SanjuBaba',
                style: TextStyle(color: Colors.grey),
              ),
              Text(
                'What would you like to cook today?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                softWrap: true,
              )
            ],
          ),
        ),
        MyAvatar(),
      ],
    );
  }
}
