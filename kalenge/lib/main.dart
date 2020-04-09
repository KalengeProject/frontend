import 'package:flutter/material.dart';
import 'package:kalenge/syle/theme.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'Register_Login/Login/loginScreen.dart';
import 'homeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  bool _isLoggedIn = false;

  void initState() {
    _checkIfLoggedIn();
    // super.initState();
  }

  void _checkIfLoggedIn() async {
    // check if token is there
    //SharedPreferences localStorage = await SharedPreferences.getInstance();
    //var token = localStorage.getString('token');
    /*if(token!= null){
      setState(() {
        _isLoggedIn = true;
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {

    return new DynamicTheme( //DarkMode
        defaultBrightness: Brightness.light,
        data: (brightness) => brightness == Brightness.light
            ? MyTheme.defaultTheme
            : MyTheme.darkTheme,
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: Scaffold(
              body: _isLoggedIn ? Home() : LogIn(),
            ),
          );
        });
  }
}
