// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_latlong/flutter_latlong.dart';
// import 'package:geolocator/geolocator.dart';
//
// class MapWidget extends StatefulWidget {
//   const MapWidget({super.key});
//
//   @override
//   _MapWidgetState createState() => _MapWidgetState();
// }
//
// class _MapWidgetState extends State<MapWidget> {
//   final _mapController = MapController();
//
//   Future<void> _getUserLocation() async {
//     final Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high,
//     );
//
//     final userLocation = LatLng(position.latitude, position.longitude);
//
//     _mapController.move(userLocation, 15.0);
//   }
//  7.418961, 13.540981
//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//       options: MapOptions(
//         center: LatLng(37.7749, -122.4194), // San Francisco
//         zoom: 13.0,
//         controller: _mapController,
//       ),
//       layers: [
//         TileLayerOptions(
//           urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//           subdomains: ['a', 'b', 'c'],
//         ),
//       ],
//     );
//   }
// }


/** RESTAURANT */
/*
Sure! Here's an example implementation of a floating action button that takes you to a restaurant registration form and saves the restaurant data to Firebase:

First, create a new screen for the restaurant registration form. In this example, we'll call it RestaurantRegistrationScreen:*/

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class RestaurantRegistrationScreen extends StatefulWidget {
//   @override
//   _RestaurantRegistrationScreenState createState() =>
//       _RestaurantRegistrationScreenState();
// }
//
// class _RestaurantRegistrationScreenState
//     extends State<RestaurantRegistrationScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _latitudeController = TextEditingController();
//   final TextEditingController _longitudeController = TextEditingController();
//   final TextEditingController _typeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register a Restaurant'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a name for the restaurant';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Name',
//                 ),
//               ),
//               TextFormField(
//                 controller: _latitudeController,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the latitude';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Latitude',
//                 ),
//               ),
//               TextFormField(
//                 controller: _longitudeController,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter the longitude';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Longitude',
//                 ),
//               ),
//               TextFormField(
//                 controller: _typeController,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a type for the restaurant';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Type',
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState.validate()) {
//                     // Save the data to Firestore
//                     FirebaseFirestore.instance.collection('restaurants').add({
//                       'name': _nameController.text,
//                       'latitude': _latitudeController.text,
//                       'longitude': _longitudeController.text,
//                       'type': _typeController.text,
//                     }).then((value) {
//                       // Navigate back to the previous screen
//                       Navigator.of(context).pop();
//                     });
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


/*
Next, in the homepage screen, add a floating action button that navigates to the RestaurantRegistrationScreen when pressed:*/

// import 'package:flutter/material.dart';
// import 'package:your_app_name/restaurant_registration_screen.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Center(
//         child: Text('Welcome to the home screen'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => RestaurantRegistrationScreen()),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


/*
Here's an example implementation of adding a floating button on the homepage that leads to a restaurant registration form:

Create a new page for the restaurant registration form. In this example, we will call it RestaurantRegistrationForm.dart.
In the HomePage widget, add a FloatingActionButton that leads to the restaurant registration form:*/

// floatingActionButton: FloatingActionButton(
// onPressed: () {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (context) => RestaurantRegistrationForm()),
// );
// },
// child: Icon(Icons.add),
// ),

// In the RestaurantRegistrationForm page, create a form with TextFormFields for the name, latitude, longitude, and type of restaurant. You can use a RaisedButton to save the form to Firebase. Here's an example:

// class RestaurantRegistrationForm extends StatefulWidget {
//   @override
//   _RestaurantRegistrationFormState createState() =>
//       _RestaurantRegistrationFormState();
// }
//
// class _RestaurantRegistrationFormState
//     extends State<RestaurantRegistrationForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _name;
//   double _latitude;
//   double _longitude;
//   String _restaurantType;
//
//   void _submitForm() {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();
//       // Save to Firebase
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register a Restaurant')),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a name';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Latitude'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a latitude';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _latitude = double.parse(value);
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Longitude'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a longitude';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _longitude = double.parse(value);
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Type of Restaurant'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a type of restaurant';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _restaurantType = value;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               RaisedButton(
//                 onPressed: _submitForm,
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
