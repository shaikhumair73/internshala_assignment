import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  String hintText;
  String content;
  TextEditingController controller;
  Icon myIcon;
  IconButton? suffIcon;
  final String? Function(String? value) validater;
  bool obscureText;

  MyTextFeild(
      {required this.hintText,
      required this.content,
      required this.controller,
      required this.myIcon,
      this.suffIcon,
      required this.validater,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validater,
      decoration: InputDecoration(
          prefixIcon: myIcon,
          suffixIcon: suffIcon,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          label: Text(
            content,
            style: TextStyle(color: Color(0xffB81736)),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

class Secondtextfeild extends StatelessWidget {
  Widget? trailing;
  String hintText;
  String? content;
  TextEditingController controller;
  //Icon myIcon;
  Icon? suffIcon;

  Secondtextfeild(
      {required this.hintText,
      this.content = "",
      required this.controller,
      this.suffIcon,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: suffIcon,
          filled: true,
          fillColor: Colors.white54,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black87),
          label: Text(
            content!,
            style: TextStyle(color: Colors.black87),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}

class My_Button extends StatelessWidget {
  Widget My_widget;
  Color My_color;
  VoidCallback onpressesed;
  My_Button(
      {required this.My_widget,
      required this.My_color,
      required this.onpressesed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.white30,
              blurRadius: 28,
              spreadRadius: 16,
              offset: Offset(0, 6),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: My_color),
            onPressed: onpressesed,
            child: My_widget),
      ),
    );
  }
}
