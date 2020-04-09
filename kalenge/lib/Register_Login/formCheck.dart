
/*
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





 final List<Widget> _children = [
   ServicesWidget(),
   FavouriteWidget()
 ];




  fillColor: Colors.white,
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2,color: Colors.white),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 2)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 2)
                  ),



  */