import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internshala_assignment/ui_pages/student_information_add_form_ui.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../onboarding/login_page.dart';

class Splash_screen extends StatefulWidget {
  //const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () async {
      // async used when value come in future
      SharedPreferences pref = await SharedPreferences.getInstance();
      var uid = pref.getString("uid");
      if (uid != null && uid.isNotEmpty) {
        // condition check
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return Student_data();
        }));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ])),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      Lottie.asset(
                          "assets/Lottie/Lotie_Animation - 1716799992653.json",
                          width: 120)
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                        fontSize: 33,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
