import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class Send_Otp extends StatelessWidget {
  var OtpSendControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " enter mobile no.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: OtpSendControler,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: '+91${OtpSendControler.text.toString()}',
                    verificationCompleted: (PhoneAuthCredential credential) {
                      print("verification completed");
                    },
                    verificationFailed: (FirebaseAuthException e) {
                      print("verification failed");
                    },
                    codeSent: (String verificationId, int? resendToken) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Otp_Screen(
                          verification_id: verificationId,
                        );
                      }));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: Text("Send Otp"))
          ],
        ),
      ),
    );
  }
}
