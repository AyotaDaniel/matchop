import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matchop/components/app-bar.dart';
import 'package:matchop/components/body.dart';
import 'package:matchop/components/bottom-nav-bar.dart';
import 'package:matchop/models/restaurant-registration.dart';
import 'package:matchop/widgets/popup.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  LatLng? _currentLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      bottomNavigationBar: const BottomNavBar(),
      body: Body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              heroTag: 'Add',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RestaurantRegistration()),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              heroTag: 'Show',
              onPressed: () {
                  _showMap();
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.location_on),
              ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showMap();
      //   },
      //   backgroundColor: Colors.blue,
      //   child: const Icon(Icons.location_on),
      // ),
    );
  }

  late List<Restaurant> restaurants;

  @override
  void initState() {
    super.initState();
    getRestaurants().then((value) {
      setState(() {
        restaurants = value;
      });
    });
  }

  Future<List<Restaurant>> getRestaurants() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('restaurants').get();
    List<Restaurant> restaurants = [];
    for (var document in snapshot.docs) {
      Map<String, dynamic> data = document.data()  as Map<String, dynamic>;
      Restaurant restaurant = Restaurant(
        name: data['name'],
        latitude: data['latitude'],
        longitude: data['longitude'],
        type: data['type'],
      );
      restaurants.add(restaurant);
    }
    return restaurants;
  }


  Future<void> _showMap() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    // setState(() {
    _currentLocation = LatLng(position.latitude, position.longitude);
    // });

    print('${_currentLocation?.latitude} and ${_currentLocation?.longitude}');

    // Build map
    final FlutterMap flutterMap = FlutterMap(
      options: MapOptions(
        center: _currentLocation ?? LatLng(7.418961, 13.540981),  // UN location
        zoom: 18.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
        CurrentLocationLayer(),
        MarkerLayer(
          markers: restaurants
              .map((restaurant) => Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(restaurant.latitude, restaurant.longitude),
            builder: (ctx) => GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Popup(
                      restaurantName: restaurant.name,
                      restaurantType: restaurant.type,
                    );
                  },
                );
              },
              child: const Icon(Icons.restaurant),
            ),
          )).toList(),
        ),
      ],
    );

    // Navigate to map screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Map'),
          ),
          body: flutterMap,
        ),
      ),
    );
  }
}

class Restaurant {
  final String name;
  final double latitude;
  final double longitude;
  final String type;

  Restaurant({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.type,
  });
}
