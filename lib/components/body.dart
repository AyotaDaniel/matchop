import 'package:flutter/material.dart';
import 'package:matchop/components/search_box.dart';
import 'package:matchop/screens/home/category_list.dart';
// import 'package:matchop/screens/home/discount_card.dart';
import 'package:matchop/screens/home/item_list.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          const CategoryList(),
          const ItemList(),
          // DiscountCard(),
        ],
      ),
    );
  }
}
