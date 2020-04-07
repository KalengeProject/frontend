import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'form/register.dart';
import 'form/formCheck.dart';
import 'theme.dart' as ThemeApp;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KalengeTheme',
      theme: ThemeApp.appTheme,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => new register()
      },
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _email;
  String _passWord;

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      home: new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Container(
                padding:EdgeInsets.fromLTRB(15.0, 100.0, 0.0, 0.0),
                child: Text('Kalenge',
                style: Theme.of(context).textTheme.headline),
              ),

              Container(
                margin: new EdgeInsets.only(top: 75.0, left: 20.0, right: 20.0),
                child: new Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: FormUI(),
                ),
              ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Pas de compte ?',
                  style:  Theme.of(context).textTheme.body2,
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    //Navigator.of(context).pushNamed('/register');
                  },
                  child: Text(
                    'Inscription',
                    style:  Theme.of(context).textTheme.body1,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

// Formulaire de connexion
  Widget FormUI() {
    return new Column(crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        new TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email'
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },

        ),

        SizedBox(height: 20.0),

        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mot De Passe'),

          keyboardType: TextInputType.text,
          validator: validatePassWord,
          onSaved: (String val) {
            _passWord = val;
          },
        ),

        SizedBox(height: 5.0),
        Container(
          alignment: Alignment(1.0, 0.0),
          padding: EdgeInsets.only(top: 15.0, left: 20.0),
          child: InkWell(
            child: Text(
              'Mot de passe oublié?',
              style:  Theme.of(context).textTheme.body2
            ),
          ),
        ),

        new SizedBox(
          height: 20.0,
        ),
        new FlatButton(
          onPressed: _validateInputs,
          color: Colors.red,
          textColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          padding: EdgeInsets.all(20.0),
          child: Text(
              'Connexion',
              style : Theme.of(context).textTheme.button
          ),

        )
      ],
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }


}

