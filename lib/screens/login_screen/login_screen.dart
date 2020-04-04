import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linked_in_like_flutter/constants.dart';
import 'login_form.dart';

const containerGradient = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  stops: [0, 1],
  colors: [Color(0xFF008CC9), Color(0xFF009EA5)],
);
const containerPadding = EdgeInsets.symmetric(
  vertical: 80.0,
  horizontal: 15.0,
);

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kColorBlue,
    ));
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: containerGradient,
        ),
        padding: containerPadding,
        child: LoginForm(),
      ),
    );
  }
}
