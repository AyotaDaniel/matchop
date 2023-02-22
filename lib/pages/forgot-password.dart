import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchop/pallete.dart';
import 'package:matchop/widgets/background-image.dart';
import 'package:matchop/widgets/rounded-button.dart';
import 'package:matchop/widgets/text-field-input.dart';

class ForgotPassword extends StatelessWidget {
  @override


  TextEditingController email = TextEditingController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackgroundImage(image: 'assets/images/login_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context); // permet de revenir sur la page precedente
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: Text(
              'mot de passe oublié',
              style: kBodyText,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Text(
                        //'Enter your email we will send instruction to reset your password',
                        'Entrez votre e-mail, nous vous enverrons des instructions pour réinitialiser votre mot de passe',
                        style: kBodyText,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextInputField(
                      controller: email,
                      icon: FontAwesomeIcons.envelope,
                      hint: 'Email',
                      inputType: TextInputType.emailAddress,
                      inputAction: TextInputAction.done,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButton(buttonName: 'Envoyer')
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
