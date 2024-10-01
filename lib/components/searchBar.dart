import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({super.key});

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    List list = [
      "Flutter",
      "React",
      "Ionic",
      "Xamarin",
    ];
    return GFSearchBar(
      searchList: list,
      searchQueryBuilder: (query, list) {
        return list
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
      overlaySearchListItemBuilder: (item) {
        return Container(
          padding: const EdgeInsets.all(8),
          child: Text(
            item,
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      onItemSelected: (item) {
        setState(() {
          print('$item');
        });
      },
    );
  }
}






// SizedBox(
//       width: MediaQuery.of(context).size.width * 0.80,
//       child: TextField(
//         onChanged: null,
//         decoration: InputDecoration(
//             hintText: "Search...",
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             )),
//       ),
//     );