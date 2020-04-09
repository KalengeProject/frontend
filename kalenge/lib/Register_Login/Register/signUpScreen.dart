import 'package:email_validator/email_validator.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
          body: formSignUp(),
      );
  }


  formSignUp(){
    return SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Inscription',
                    style: Theme.of(context).textTheme.title,),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  new TextFormField(
                    controller: mailController,
                    decoration: new InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) => !EmailValidator.validate(val, true) ? 'Mail Invalide.' : null,
                  ),
                  SizedBox(height: 20.0),

                  new TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                      labelText: "Mot De Passe",
                    ),
                    keyboardType: TextInputType.text,
                    validator: (val) => val.length < 4 ? 'Mot de passe trop court' : null,

                  ),

                  SizedBox(height: 20.0),
                  new FlatButton(
                    onPressed: _isLoading ? _handleLogin : _handleLogin,
                    child: Text('Inscription',style : Theme.of(context).textTheme.button,),
                    color: Color(0xFFF0BC02),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    padding: EdgeInsets.all(20.0),
                  ),

                  SizedBox(height: 5.0),
                  new FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                           MaterialPageRoute(builder: (context) => LogIn()));
                        },
                    child: Text('Retour',style : Theme.of(context).textTheme.body1,),
                    color: Color(0xFFFFFFFF),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    padding: EdgeInsets.all(20.0),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  void _handleLogin() async {
    final form = _formKey.currentState;

    if (form.validate()) {
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
}