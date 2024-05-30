import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_assignment/onboarding/email_verification_screen.dart';

import 'package:internshala_assignment/onboarding/signup_page.dart';
import 'package:internshala_assignment/ui_pages/student_information_add_form_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Costum_widget/Costum_Textfeild.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//  const LoginPage({super.key});

  var emailControler = TextEditingController();

  var passControler = TextEditingController();
// hide password is used for obscure text
  bool hidePasswod = true;

  // mFormkey is used for Regix
  var mFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //safeArea widget is used for Ui show below the display camera it left the top of notch space
        body: SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffB81736),
          Color(0xff281537),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                //MediaQuery is used for size  and make ui responsive
                height: MediaQuery.of(context).size.height * 0.25,
                child: Text(
                  "Hello\nSign in!",
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            // Expanded widget us used to fix height when we use column it take full height
            // so expanded widget fix height of another widget
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                // form widget  provide Global key which will be used in regex
                child: Form(
                  key: mFormKey, //global key
                  //SingleChildScrollView used for scrollable content
                  child: SingleChildScrollView(
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(boxShadow: [
                                // box shadow used for give shadow
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 14,
                                    spreadRadius: 7,
                                    offset: Offset(0, 5))
                              ]),
                              child: MyTextFeild(
                                validater: (value) {
                                  // pattern for gmail this pattern follow then gmail  will be correct
                                  const pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.'
                                      r'[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  final regxp = RegExp(pattern);
                                  if (value!.isEmpty) {
                                    return "email does not exist";
                                  } else if (!regxp.hasMatch(value)) {
                                    return "enter valid email";
                                  }
                                },
                                hintText: "enter your Gmail",
                                content: "Gmail",
                                controller: emailControler,
                                myIcon: Icon(
                                  Icons.email,
                                  color: Color(0xffB81736),
                                ),
                              ),
                            ),
                          ),
                          //size-box is used to space bw text field
                          SizedBox(
                            height: 10,
                          ),
                          //password Text field
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.07,
                              child: MyTextFeild(
                                validater: (value) {
                                  if (value!.length <= 7) {
                                    return "length required 8 character";
                                  }
                                },
                                myIcon: Icon(
                                  Icons.key,
                                  color: Color(0xffB81736),
                                ),
                                suffIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        hidePasswod = !hidePasswod;
                                      });
                                    },
                                    icon: Icon(hidePasswod
                                        ? Icons.visibility_off
                                        : Icons.visibility)),
                                hintText: "enter your password",
                                content: "Password",
                                obscureText: hidePasswod,
                                controller: passControler,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          My_Button(
                              My_widget: Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                              My_color: Color(0xffB81736),
                              onpressesed: () async {
                                if (mFormKey.currentState!.validate()) {
                                  try {
                                    var auth = FirebaseAuth.instance;
                                    var usercred =
                                        await auth.signInWithEmailAndPassword(
                                            email:
                                                emailControler.text.toString(),
                                            password:
                                                passControler.text.toString());

                                    var loginId =
                                        usercred.user!.uid; // login id
                                    // shared pref is used to store loginId
                                    SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    pref.setString("uid", loginId);

                                    Navigator.pushReplacement(
                                        context, // Navigator is used for next page
                                        MaterialPageRoute(builder: (context) {
                                      return Student_data();
                                    }));
                                  } on FirebaseAuthException catch (e) {
                                    // firebase exception
                                    if (e.code == 'weak-password') {
                                      print(
                                          'The password provided is too weak.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "The password provided is too weak")));
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'The account already exists for that email.');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text(
                                                  "The account already exists for that email")));
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("${e}")));
                                  }
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              children: [
                                Text(
                                  "dont have account? ",
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return Sighn_page();
                                      }));
                                    },
                                    child: Text(
                                      "create now",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Column(
                            children: [
                              My_Button(
                                My_widget: Text(
                                  "Login with Phone No.",
                                  style: TextStyle(color: Colors.white),
                                ),
                                My_color: Color(0xff281537),
                                onpressesed: () {},
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
