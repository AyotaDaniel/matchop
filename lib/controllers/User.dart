import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matchop_1/models/userModel.dart';
import 'package:http/http.dart' as http;

class User {
  //async et await permet d'éviter de stopper l'application pendant le traitement des requêtes vers la bd
  //Future permet de representer une reussite du traitement de la requête qui sera dispo a un moment précis dans le futur

  Future<String?> addUser(UserModel userModel) async {
    var url = "http://192.168.43.43:8080/matchop/Users/addAccount";
    // print(userModel.login);
    // print(userModel.pwd);
    // print(userModel.email);

    Map myPost = {"email": userModel.email};
    myPost["pwd"] = userModel.pwd;
    myPost["login"] = userModel.login;
    myPost["nom"] = userModel.nom;
    myPost["prenom"] = userModel.prenom;
    myPost["tel"] = userModel.tel;
    print(myPost);
    final response = await http.post(url, body: myPost);
    // if (response.statusCode == 200) {
    //   print('Add Response : ' + response.body);
    //   return response.body;
    // } else {
    //   print(response.statusCode);
    //   return "error";
    // }
    print(jsonDecode(response.body.toString()));
    if (jsonDecode(response.body.toString()) == 'Ce compte existe déjà') {
      Fluttertoast.showToast(
          msg: 'Ce compte existe déjà !!',
          gravity: ToastGravity.BOTTOM_RIGHT,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          fontSize: 16.0);
    } else {
      if (jsonDecode(response.body.toString()) == true) {
        Fluttertoast.showToast(
            msg: 'L\'enregistrement du compte a été effectué !!',
            gravity: ToastGravity.BOTTOM_RIGHT,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: 'Echec d\'enregistrement du compte !!',
            gravity: ToastGravity.BOTTOM_RIGHT,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            toastLength: Toast.LENGTH_LONG,
            fontSize: 16.0);
      }
    }
  }
}
