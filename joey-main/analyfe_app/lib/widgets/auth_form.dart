import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  //Required input for Authform
  AuthForm(
    this.submitFn,
    this.isLoading,
  );

  final bool isLoading;
  //submit function with user credentials sent from auth_screen file
  final void Function(
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  //initialize blank values for user credentials
  var _isLogin = true;
  var _userEmail = '';
  var _userPassword = '';

  //Use those values to send our auth request
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userPassword.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            //Set form for entering user credentials
            child: Form(
              key: _formKey,
              //set column with email, password, and login navigation buttons
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Email form field
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      //ADD MORE ROBUST EMAIL CHECKING METHODS
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Please enter a vald email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  //Password form field
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      //ADD MORE ROBUST PASSWORD VERIFICATION???
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be at least 7 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(height: 12),
                  //buttons to navigate login options
                  if (widget.isLoading)
                    CircularProgressIndicator(), //waiting switch
                  if (!widget.isLoading)
                    RaisedButton(
                      child: Text(_isLogin ? 'Login' : 'Signup'),
                      onPressed: _trySubmit,
                    ),
                  if (!widget.isLoading)
                    FlatButton(
                      child: Text(_isLogin
                          ? 'Create New Account'
                          : 'I already have an account'),
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
      ),
    );
  }
}
