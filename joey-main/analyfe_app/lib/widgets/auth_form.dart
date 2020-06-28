import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email Address'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                //
                //Section for Buttons
                RaisedButton(
                  child: Text(_isLogin ? 'Login' : 'Signup'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(_isLogin ? 'Create New Account' : 'Login'),
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
