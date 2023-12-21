import 'package:demo/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  forgotpassword(String email)async{
  if(email == ""){
    return UiHelper.CustomeAlertBox(context, "Enter Email to Reset Password");
  }else{
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Pasword"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              forgotpassword(emailController.text.toString());
            },

            style: TextButton.styleFrom(
              backgroundColor: Colors.purple,
              fixedSize: Size(300, 50),
            ),
            child: Text(
              "Reset Password ?",
              style: TextStyle(fontSize: 25, ),
            ),
          )

        ],
      ),
    );
  }
}
