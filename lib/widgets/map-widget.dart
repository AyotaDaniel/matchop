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
//
// MarkerLayerOptions(
// markers: _markers,
// markerBuilder: (marker) {
// return Marker(
// point: marker.point,
// builder: (ctx) => GestureDetector(
// onTap: () {
// showDialog(
// context: context,
// builder: (context) {
// return Popup(
// restaurantName: marker.restaurantName,
// restaurantType: marker.restaurantType,
// );
// },
// );
// },
// child: Icon(Icons.restaurant),
// ),
// );
// },
// ),
