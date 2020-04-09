import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kalenge/Register_Login/Login/loginScreen.dart';
import '../../homeScreen.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
      );

  }

  void _handleLogin() async {

    setState(() {
      _isLoading = true;
    });

    var data = {
      'email': mailController.text,
      'password': passwordController.text
    };

    //var res = await CallApi().postData(data, 'register');
    //var body = json.decode(res.body);

    if (true) {
      //SharedPreferences localStorage = await SharedPreferences.getInstance();
      //localStorage.setString('token', body['token']);
      //localStorage.setString('user', json.encode(body['user']));

      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => Home()));
    }
  }
}