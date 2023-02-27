import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:matchop/pallete.dart';
import 'package:matchop/widgets/widgets.dart';
import 'package:matchop/net/flutterfire.dart';

class Authentication extends StatefulWidget {
	const Authentication({ Key? key }) : super(key: key);

	@override
	_AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
	TextEditingController email = TextEditingController();
	TextEditingController password = TextEditingController();

	@override
	Widget build(BuildContext context) {
		Size size = MediaQuery.of(context).size;
		bool isLoading = false;

		return Stack(
			children: [
				const BackgroundImage(
					image: 'assets/images/login_bg.png',
				),
				Scaffold(
					backgroundColor: Colors.transparent,
					body: Column(
						children: [
							const Flexible(
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
										controller: password,
										icon: FontAwesomeIcons.lock,
										hint: 'Mot de passe',
										inputAction: TextInputAction.done,
									),
									GestureDetector(
										onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
										child: const Text(
											'Mot de passe oublié ?',
											style: styleText,
										),
									),
									const SizedBox(
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
											onPressed:  () async {
												if (email.text.isEmpty) {
													Fluttertoast.showToast(
															msg: 'Le champ email est obligatoire !',
															gravity: ToastGravity.BOTTOM_RIGHT,
															backgroundColor: Colors.red,
															textColor: Colors.white,
															toastLength: Toast.LENGTH_LONG,
															fontSize: 16.0);
												} else {
													setState(() {
														isLoading = true;
														print(isLoading);
													});

													bool isAuthenticated = await signIn(email.text, password.text);
													if(!isAuthenticated)
													{
														setState(() {
															isLoading = false;
														});
														print(isLoading);
														Fluttertoast.showToast(
																msg: 'Échec d\'authentification, veuillez réessayer!',
																gravity: ToastGravity.BOTTOM_RIGHT,
																backgroundColor: Colors.red,
																textColor: Colors.white,
																toastLength: Toast.LENGTH_LONG,
																fontSize: 16.0);
													}else{
														setState(() {
															isLoading = false;
														});
														Navigator.pushNamed(context, 'Home');
													}
												}
											},
											child: isLoading
												? CircularProgressIndicator()
												: Text(
												'Se connecter',
												style: kBodyText.copyWith(fontWeight: FontWeight.bold),
											),
										),
									),
									const SizedBox(
										height: 25,
									),
								],
							),
							GestureDetector(
								onTap: () => Navigator.pushNamed(context,
										'CreateNewAccount'), // nous renvoi a la classe CreateNewAccount comme defini dans le route du materialApp
								child: Container(
									decoration: const BoxDecoration(
											border:
											Border(bottom: BorderSide(width: 1, color: kWhite))),
									child: const Text(
										'Créer un Compte',
										style: kBodyText,
									),
								),
							),
							const SizedBox(
								height: 20,
							),
						],
					),
				)
			],
		);
	}
}