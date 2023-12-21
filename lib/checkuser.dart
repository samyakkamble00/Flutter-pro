  import 'package:demo/loginpage.dart';
  import 'package:demo/main.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

  class CheckUser extends StatefulWidget {
    const CheckUser({super.key});

    @override
    State<CheckUser> createState() => _CheckUserState();
  }

  class _CheckUserState extends State<CheckUser> {
    @override
    Widget build(BuildContext context) {
      return checkuser();
    }

    checkuser(){
      final user = FirebaseAuth.instance.currentUser;
      if(user != null){
        return MyHomePage(title: "HomeScreen");
      }else{
        return LoginPage();
      }
    }
  }
