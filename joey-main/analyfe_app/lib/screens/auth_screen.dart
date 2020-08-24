import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance; //Store login attempt
  var _isLoading = false; //Passed to AuthForm to load intermediate login screen

  //User information widget that is sent to Authform
  void _submitAuthForm(
    String email,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });
      if (isLogin) {
        //Sign in attempt
        authResult = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      } else {
        //Create new user attempt
        authResult = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        //Add new user email to Firebase database
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({
          'email': email,
        });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials.';

      if (err.message != null) {
        message =
            err.message; //Display error login message if there is a message
      }

      //RIGHT FORMAT FOR THEME?
      //Load error message on a new popup
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  //Load Authform widget on screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
