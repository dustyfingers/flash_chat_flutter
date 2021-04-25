import 'package:flutter/material.dart';

import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController logoAnimationController;
  Animation logoAnimation;

  @override
  void initState() {
    super.initState();

    logoAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    logoAnimation = CurvedAnimation(
        parent: logoAnimationController, curve: Curves.decelerate);

    logoAnimationController.forward();

    // to make the animation loop!
    // logoAnimation.addStatusListener((status) {
    //   print(status);
    //   if (status == AnimationStatus.completed) {
    //     logoAnimationController.reverse(from: 1.0);
    //   }
    //   if (status == AnimationStatus.dismissed) {
    //     logoAnimationController.forward();
    //   }
    // });

    logoAnimationController.addListener(() {
      setState(() {});
    });
  }

  // !!! animations use resources!
  // !! dispose of your animation controller after using an animation or you
  // will be leaving garbage everywhere
  @override
  void dispose() {
    super.dispose();
    logoAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'Logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: logoAnimation.value * 90,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
