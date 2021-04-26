import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedSplashLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Hero(
          tag: 'Logo',
          child: Container(
            child: Image.asset('images/logo.png'),
            height: 90,
          ),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Flash Chat',
              textStyle: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
              speed: const Duration(milliseconds: 100),
            ),
          ],
          totalRepeatCount: 2,
          pause: const Duration(milliseconds: 2000),
        ),
      ],
    );
  }
}
