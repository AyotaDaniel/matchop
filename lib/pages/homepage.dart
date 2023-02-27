import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:matchop/components/app-bar.dart';
import 'package:matchop/components/body.dart';
import 'package:matchop/components/bottom-nav-bar.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMap();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.location_on),
      ),
    );
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
        Center(
            child: Text(
              'Current Location: Lat-${_currentLocation!.latitude}, Long-${_currentLocation!.longitude}',
              style: const TextStyle(fontSize: 25),
            )
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
