import 'dart:developer';

import 'package:demo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  String verificationId;

  OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Screen"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Enter The OTP",
                  suffixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = await PhoneAuthProvider
                      .credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text.toString());
                  FirebaseAuth.instance.signInWithCredential(credential).then((
                      value) {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "MyHomePage")));
                  });
                } catch (ex) {
                  log(ex.toString());
                }
              },
              child: Text("Verify OTP"))
        ],
      ),
    );
  }
}
