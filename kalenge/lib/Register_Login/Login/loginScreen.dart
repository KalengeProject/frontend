import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:kalenge/Register_Login/Register/signUpScreen.dart';
import '../../homeScreen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();


  _showMsg(msg) { //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: formLogin(),
      );
  }

  formLogin(){
    return SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text('Kalenge',
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
                    validator: (val) => val.length < 4 ? 'Mot de passe trop court' : null,
                    keyboardType: TextInputType.text,

                  ),
                  SizedBox(height: 5.0),
                  Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top: 15.0, left: 20.0),

                    child: InkWell(

                      child: Text('Mot de passe oublié?', style : Theme.of(context).textTheme.body2,),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  new FlatButton(
                    onPressed: _isLoading ? _login : _login,
                    child: Text('Connexion',style : Theme.of(context).textTheme.button,),
                    color: Color(0xFFF0BC02),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    padding: EdgeInsets.all(20.0),
                  ),

                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Text(
                        'Pas de compte ?',
                      ),
                      SizedBox(width: 5.0),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Inscription',
                          style : Theme.of(context).textTheme.body2,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login() async {
    final form = _formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
      });

      var data = {
        'email': mailController.text,
        'password': passwordController.text
      };

      bool tempo = (mailController.text == "abdu31100@hotmail.fr");
      /* var res = await CallApi().postData(data, 'login');
    var body = json.decode(res.body); */

      if (tempo) {
        /* SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);
      localStorage.setString('user', json.encode(body['user']));*/
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => Home()));
      }

      setState(() {
        _isLoading = false;
      });
    } else {
      _showMsg("Hop Hop Hop, on le remplit bien!!!");
    }
  }

}
