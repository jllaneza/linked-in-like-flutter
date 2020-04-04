import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/login_screen/index.dart';

const emailTextLabel = 'Email';
const passwordTextLabel = 'Password';
const signInButtonLabel = 'SIGN IN';
final passwordSuffixIcon = Icon(
  FontAwesomeIcons.solidEyeSlash,
  color: Colors.white.withOpacity(0.6),
  size: 17.0,
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
