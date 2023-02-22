// import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchop/controllers/User.dart';
import 'package:matchop/models/userModel.dart';
import 'package:matchop/pallete.dart';
import 'package:matchop/widgets/background-image.dart';
// import 'package:hermanFlutter/widgets/rounded-button.dart';
import 'package:matchop/widgets/text-field-input.dart';
import 'package:matchop/widgets/password-input.dart';
import '../pallete.dart';

class CreateNewAccount extends StatefulWidget {
  @override
  CreateNewAccountState createState() => CreateNewAccountState();
}

class CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController loginCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController prenomCtrl = TextEditingController();
  TextEditingController telCtrl = TextEditingController();

  add(UserModel userModel) async {
    await User().addUser(userModel);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/register_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.1,
                ),
                Stack(
                  children: [
                    Center(
                      child: ClipOval(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                          child: CircleAvatar(
                            radius: size.width * 0.14,
                            backgroundColor: Colors.grey[400]?.withOpacity(
                              0.4,
                            ),
                            child: Icon(
                              FontAwesomeIcons.user,
                              color: kWhite,
                              size: size.width * 0.1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      //la flèche
                      top: size.height * 0.08,
                      left: size.width * 0.56,
                      child: Container(
                        height: size.width * 0.1,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          color: kBlue,
                          shape: BoxShape.circle,
                          border: Border.all(color: kWhite, width: 2),
                        ),
                        child: Icon(
                          FontAwesomeIcons.arrowUp,
                          color: kWhite,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.width * 0.1,
                ),
                Column(
                  children: [
                    TextInputField(
                      controller: loginCtrl,
                      icon: FontAwesomeIcons.user,
                      hint: 'Login',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),
                    PasswordInput(
                      controller: pwdCtrl,
                      icon: FontAwesomeIcons.lock,
                      hint: 'Mot de passe',
                      inputAction: TextInputAction.next,
                    ),

                    TextInputField(
                      controller: nomCtrl,
                      icon: FontAwesomeIcons.userAlt,
                      hint: 'Nom',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),

                    TextInputField(
                      controller: prenomCtrl,
                      icon: FontAwesomeIcons.userAlt,
                      hint: 'prénom',
                      inputType: TextInputType.name,
                      inputAction: TextInputAction.next,
                    ),

                    TextInputField(
                      controller: emailCtrl,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.next,
                    ),
                    TextInputField(
                      controller: telCtrl,
                      icon: FontAwesomeIcons.phone,
                      hint: 'Telephone',
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.next,
                    ),
                    
                    // PasswordInput(
                    //   icon: FontAwesomeIcons.lock,
                    //   hint: 'Confirmer',
                    //   inputAction: TextInputAction.done,
                    // ),
                    SizedBox(
                      height: 25,
                    ),

                    Container(
                      height: size.height * 0.06,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: kBlue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (loginCtrl.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Le champ login est obligatoire',
                                gravity: ToastGravity.BOTTOM_RIGHT,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                toastLength: Toast.LENGTH_LONG,
                                fontSize: 16.0);
                          } else {
                            UserModel userModel = UserModel(
                                login: loginCtrl.text,
                                nom: nomCtrl.text,
                                prenom: prenomCtrl.text,
                                email: emailCtrl.text,
                                tel: telCtrl.text,
                                pwd: pwdCtrl.text
                              );
                            // print(userModel);
                            add(userModel);
                          }
                        },
                        child: Text(
                          'S\'inscrire',
                          style:
                              kBodyText.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    // RoundedButton(buttonName: 'S\'inscrire'),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, '');
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     elevation: 2,
                    //     primary: Colors.blueAccent,
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(15.0),
                    //     child: Text(
                    //       'S\'inscrire',
                    //       style: TextStyle(
                    //           fontSize: 22, fontWeight: FontWeight.bold),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                    // ),

                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vous avez déjà un compte?',
                          style: kBodyText,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        'Connexion',
                        style: kBodyText.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

         

        )
      ],
    );
  }
}
