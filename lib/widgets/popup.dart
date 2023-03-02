import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  final String restaurantName;
  final String restaurantType;

  const Popup({super.key, required this.restaurantName, required this.restaurantType});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(restaurantName),
      content: Text('C\'est un restaurant $restaurantType'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}