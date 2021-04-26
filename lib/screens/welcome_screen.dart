import 'package:flutter/material.dart';

import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flash_chat_flutter/components/custom_button.dart';
import 'package:flash_chat_flutter/components/animated_splash_logo.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController bgAnimationController;
  Animation bgAnimation;

  @override
  void initState() {
    super.initState();

    bgAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    bgAnimation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(bgAnimationController);

    bgAnimationController.forward();

    bgAnimationController.addListener(() {
      setState(() {});
    });
  }

  // !!! animations use resources!
  // !! dispose of your animation controller after using an animation or you
  // ! will be leaving garbage everywhere
  @override
  void dispose() {
    super.dispose();
    bgAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AnimatedSplashLogo(),
            CustomButton(
              color: Colors.lightBlueAccent,
              handleButtonPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Log In',
            ),
            CustomButton(
              color: Colors.blueAccent,
              handleButtonPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
