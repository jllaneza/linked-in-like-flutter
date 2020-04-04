import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const emailTextLabel = 'Email';
const passwordTextLabel = 'Password';
const signInButtonLabel = 'SIGN IN';
const signInButtonWidth = double.infinity;
const signInButtonHeight = 50.0;
const signInButtonTextStyle = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 20.0,
  color: Colors.white,
);
const signInButtonBorderSide = BorderSide(
  color: Colors.white,
);
const forgotPasswordButtonLabel = 'FORGOT PASSWORD?';
const joinButtonLabel = 'JOIN NOW';
const footerButtonTextStyle = TextStyle(
  color: Colors.white,
);
const footerButtonPadding = EdgeInsets.all(8.0);
const textFormFieldGap = 8.0;
const passwordAndSignInGap = 25.0;
final passwordSuffixIcon = Icon(
  FontAwesomeIcons.solidEyeSlash,
  color: Colors.white.withOpacity(0.6),
  size: 17.0,
);
const textFormFieldStyle = TextStyle(
  color: Colors.white,
);
const textFormFieldBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
  ),
);
const textFormFieldFocusedBorder = UnderlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
    width: 2.0,
  ),
);
const textFormFieldPadding = EdgeInsets.symmetric(
  vertical: 5.0,
);
const textFormFieldLabelColor = Colors.white;
final textFormFieldLabelFocusedColor = Colors.white.withOpacity(0.7);

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool touched = false;
  FocusNode _emailFocusNode;
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();

    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildTextFormField(
            labelText: emailTextLabel,
            focusNode: _emailFocusNode,
            autovalidate: touched,
            onFieldSubmitted: (v) {
              _passwordFocusNode.requestFocus();
            },
            onTap: () {
              setState(() {
                _passwordFocusNode.requestFocus();
              });
            },
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: textFormFieldGap,
          ),
          _buildTextFormField(
            labelText: passwordTextLabel,
            suffixIcon: passwordSuffixIcon,
            focusNode: _passwordFocusNode,
            obscureText: true,
            autovalidate: touched,
            onTap: () {
              setState(() {
                _passwordFocusNode.requestFocus();
              });
            },
            validator: passwordValidator,
          ),
          SizedBox(
            height: passwordAndSignInGap,
          ),
          SizedBox(
            width: signInButtonWidth,
            height: signInButtonHeight,
            child: OutlineButton(
              onPressed: onFormSubmit,
              borderSide: signInButtonBorderSide,
              child: Text(
                signInButtonLabel,
                style: signInButtonTextStyle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildFooterButton(
                labelText: forgotPasswordButtonLabel,
                onPressed: () {},
              ),
              _buildFooterButton(
                labelText: joinButtonLabel,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  TextFormField _buildTextFormField({
    labelText,
    focusNode,
    validator,
    onFieldSubmitted,
    onTap,
    keyboardType,
    suffixIcon,
    obscureText = false,
    autovalidate = false,
  }) {
    return TextFormField(
      focusNode: focusNode,
      style: textFormFieldStyle,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: focusNode.hasFocus
              ? textFormFieldLabelFocusedColor
              : textFormFieldLabelColor,
        ),
        enabledBorder: textFormFieldBorder,
        focusedBorder: textFormFieldFocusedBorder,
        contentPadding: textFormFieldPadding,
        suffixIcon: suffixIcon,
      ),
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autovalidate: autovalidate,
    );
  }

  FlatButton _buildFooterButton({labelText, onPressed}) {
    return FlatButton(
      child: Text(
        labelText,
        style: footerButtonTextStyle,
      ),
      padding: footerButtonPadding,
      onPressed: onPressed,
    );
  }

  String passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter a password';
    }

    if (value.length < 6) {
      return 'Please enter a password with at least 6 characters';
    }

    return null;
  }

  String emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email address';
    }

    if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
      return 'Email Address is not valid';
    }

    return null;
  }

  void onFormSubmit() {
    if (!touched) {
      touched = true;
    }

    _formKey.currentState.validate();
  }
}
