import 'package:flutter/material.dart';
import 'package:matchop/screens/details/details-screen.dart';
import 'package:matchop/screens/home/item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          ItemCard(
            // svgSrc: "assets/icons/burger_beer.svg",
            title: "Double cheeseburger",
            shopName: "Safari",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailsScreen();
                  },
                ),
              );
            },
          ),
          ItemCard(
            // svgSrc: "assets/icons/chinese_noodles.svg",
            title: "Poulet DG",
            shopName: "Safari",
            press: () {},
          ),
          ItemCard(
            // svgSrc: "assets/icons/burger_beer.svg",
            title: "Poisson pané",
            shopName: "Safari",
            press: () {},
          )
        ],
      ),
    );
  }
}
