import 'package:flutter/material.dart';
import 'package:matchop/constants.dart';
import 'package:matchop/screens/details/components/item_image.dart';
import 'package:matchop/screens/details/components/order_button.dart';
import 'package:matchop/screens/details/components/title_price_rating.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemImage(
          imgSrc: "assets/images/burger.png",
        ),
        Expanded(
          child: ItemInfo(),
        ),
      ],
    );
  }
}

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          shopeName(name: "Safari"),
          TitlePriceRating(
            name: "Double Cheese Burger",
            numOfReviews: 24,
            rating: 4,
            price: 1000,
            onRatingChanged: (value) {},
          ),
          Text(
            "Le Double Cheeseburger de Safari comprend deux galettes de hamburger 100% pur bœuf assaisonnées avec juste une pincée de sel et de poivre. Il est garni de cornichons acidulés, d'oignons hachés, de ketchup, de moutarde et de deux tranches de fromage américain fondant. Il y a 450 calories dans Safari Double Cheeseburger..",
            style: TextStyle(
              height: 1.5,
            ),
          ),
          SizedBox(height: size.height * 0.1),
          
          // Free space  10% of total height
          OrderButton(
            size: size,
            press: () {},
          ),
          
        ],
      ),

    );
    
  }

  Row shopeName({String? name}) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: ksecondaryColor,
        ),
        SizedBox(width: 10),
        Text(name!),
      ],
    );
  }
}
