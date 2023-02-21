import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchop_1/pallete.dart';
import 'package:matchop_1/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(
          image: 'assets/images/login_bg.png',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'MaTchop',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JosefinSans-Regular',
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    controller: email,
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                  ),
                  PasswordInput(
                    controller: pwd,
                    icon: FontAwesomeIcons.lock,
                    hint: 'Mot de passe',
                    inputAction: TextInputAction.done,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    child: Text(
                      'Mot de passe oublié',
                      style: styleText,
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: kBlue,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Home');
                        print('object button');
                      },
                      child: Text(
                        'se connecter',
                        style: kBodyText.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context,
                    'CreateNewAccount'), // nous renvoi a la classe CreateNewAccount comme defini dans le route du materialApp
                child: Container(
                  child: Text(
                    'Créer un Nouveau Compte',
                    style: kBodyText,
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
