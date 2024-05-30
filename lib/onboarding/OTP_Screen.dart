
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internshala_assignment/ui_pages/student_information_add_form_ui.dart';

class Otp_Screen extends StatelessWidget {
  String verification_id;
  Otp_Screen({required this.verification_id});
  var Otp1_controiler = TextEditingController();
  var Otp2_controiler = TextEditingController();
  var Otp3_controiler = TextEditingController();
  var Otp4_controiler = TextEditingController();
  var Otp5_controiler = TextEditingController();
  var Otp6_controiler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "Please Enter 4-digit Code",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                "we sent you 4 digit-code at",
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "(+917398106637)",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Edit",
                          style:
                          TextStyle(color: Colors.deepOrange, fontSize: 20),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyTextFeild(
                          controller: Otp1_controiler,
                          mFocus: true,
                          context: context),
                      MyTextFeild(
                          controller: Otp2_controiler,
                          mFocus: false,
                          context: context),
                      MyTextFeild(
                          controller: Otp3_controiler,
                          mFocus: false,
                          context: context),
                      MyTextFeild(
                          controller: Otp4_controiler,
                          mFocus: false,
                          context: context),
                      MyTextFeild(
                          controller: Otp5_controiler,
                          mFocus: false,
                          context: context),
                      MyTextFeild(
                          controller: Otp6_controiler,
                          mFocus: false,
                          context: context),
                    ],
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            foregroundColor: Colors.white),
                        onPressed: () async {
                          if (Otp1_controiler != null &&
                              Otp2_controiler != null &&
                              Otp3_controiler != null &&
                              Otp4_controiler != null &&
                              Otp5_controiler != null &&
                              Otp6_controiler != null) {
                            var otp =
                                "${Otp1_controiler.text.toString()}${Otp2_controiler.text.toString()}"
                                "${Otp3_controiler.text.toString()}${Otp4_controiler.text.toString()}"
                                "${Otp5_controiler.text.toString()}${Otp6_controiler.text.toString()}";
                            var userCredential = PhoneAuthProvider.credential(
                                verificationId: verification_id, smsCode: otp);
                            var auth = FirebaseAuth.instance;
                            UserCredential usercred =
                            await auth.signInWithCredential(userCredential);
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                                  return Student_data();
                                }));
                          }
                        },
                        child: Text("submit"))),
              )
            ],
          ),
        ),
      ),
    );
  }

  MyTextFeild(
      {required TextEditingController controller,
        required bool mFocus,
        required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1,
      child: TextField(
        autofocus: mFocus,
        decoration: InputDecoration(
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide(width: 14, color: Colors.black))),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
