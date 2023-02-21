import 'package:flutter/material.dart';
import 'package:matchop_1/screens/home/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // permet de scroller horizontalement les categories
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Fritures/Grillades",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
            title: "Salades",
            press: () {},
          ),
          CategoryItem(
            title: "Mets africain",
            press: () {},
          ),
          CategoryItem(
            title: "Boissons",
            press: () {},
          ),
        ],
      ),
    );
  }
}
