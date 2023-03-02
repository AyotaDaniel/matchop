import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantRegistration extends StatefulWidget {
  const RestaurantRegistration({super.key});

  @override
  _RestaurantRegistrationState createState() => _RestaurantRegistrationState();
}

class _RestaurantRegistrationState extends State<RestaurantRegistration> {

  _RestaurantRegistrationState(){
    _typeController = _restaurantTypes[1];
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  late String _typeController = '';

  final _restaurantTypes = [
    'Tourne-dos',
    'Africain',
    'Italien',
    'Asiatique',
  ];

  Widget _buildName() {
    return TextFormField(
      controller: _nameController,
      validator: (value) {
        if (null == value || value.isEmpty) {
          return 'Le nom du restaurant est requis !';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Nom',
      ),
    );
  }

  Widget _buildLatitude() {
    return TextFormField(
      controller: _latitudeController,
      validator: (value) {
        if (null == value || value.isEmpty) {
          return 'La coordonnée latitude est requise !';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Latitude',
      ),
    );
  }

  Widget _buildLongitude() {
    return TextFormField(
      controller: _longitudeController,
      validator: (value) {
        if (null == value || value.isEmpty) {
          return 'La coordonnée longitude est requise !';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Longitude',
      ),
    );
  }

  Widget _buildType() {
    return DropdownButtonFormField(
      value: _typeController,
      onChanged: (value) {
        setState(() {
          _typeController = value!;
        });
      },
      decoration: const InputDecoration(
        labelText: 'Type',
      ),
      items: _restaurantTypes.map(
          (value){
            return DropdownMenuItem(value: value,child: Text(value),);
          }
      ).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Désignez le type de restaurant !';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enregistrer un Restaurant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildName(),
              _buildLatitude(),
              _buildLongitude(),
              _buildType(),
              const SizedBox(height: 13.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    // Save the data to Firestore
                    FirebaseFirestore.instance.collection('restaurants').add({
                      'name': _nameController.text,
                      'latitude': double.parse(_latitudeController.text),
                      'longitude': double.parse(_longitudeController.text),
                      'type': _typeController,
                    }).then((value) {
                      // Navigate back to the previous screen
                      Navigator.of(context).pop();
                    });
                  }
                },
                child: const Text(
                  'Enregistrer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
