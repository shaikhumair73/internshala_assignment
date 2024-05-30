import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment/Bloc/student_data_bloc.dart';
import 'package:internshala_assignment/Costum_widget/Costum_Textfeild.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';
import 'package:internshala_assignment/onboarding/login_page.dart';
import 'package:internshala_assignment/ui_pages/Second_page_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Student_data extends StatefulWidget {
  @override
  State<Student_data> createState() => _Student_dataState();
}

class _Student_dataState extends State<Student_data> {
//  const Student_data({super.key});
  var nameController = TextEditingController();

  String? age; //  student age
  String? GenderValue = "Male"; // define student is  Male or Female

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black87,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black87,
                ),
                label: "profile"),
            BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return My_Page(uid: pref.getString("uid"));
                    }));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 25,
                    color: Colors.black87,
                  ),
                ), //click on arrow go to on next page where data add
                label: "Next page"),
          ],
        ),

        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     SharedPreferences pref = await SharedPreferences.getInstance();
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return My_Page(uid: pref.getString("uid"));
        //     }));
        //   },
        // ),
        appBar: AppBar(
          title: Text(
            "Student Registration",
            style: TextStyle(color: Colors.black87),
          ),
          actions: [
            IconButton(
                // logout functionality used here
                onPressed: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.remove("uid");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                icon: Icon(Icons.logout))
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffB81736),
              Color(0xff281537),
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20),
                  child: Text(
                    "Name",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Secondtextfeild(
                        hintText: "Enter Student name ",
                        controller: nameController),
                  ),
                ), // text field for name controller
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 30),
                  child: Text(
                    "Age",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.77,
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          title: age != null ? Text(age!) : Text("Select age"),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        DateTime? datePicked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2024, 12, 31),
                        );
                        if (datePicked != null) {
                          setState(() {
                            age =
                                "${datePicked.day}-${datePicked.month}-${datePicked.year}";
                          });
                        }
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ), // row used show container and calender icon
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 22),
                  child: Text(
                    "Gender",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // select age from dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Text(GenderValue!),
                      trailing: DropdownButton<String>(
                          //dropdown widget is used for select age from dopdown
                          menuMaxHeight: 300,
                          items: [
                            DropdownMenuItem<String>(
                              child: Text("Male"),
                              value: "Male",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("Female"),
                              value: "Female",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              GenderValue = value!;
                            });
                          }),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                // submit button here in which all operation performed
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Container(
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white54,
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xff281537),
                        ),
                        onPressed: () async {
                          if (nameController != null &&
                              GenderValue != null &&
                              age != null) {
                            var currtime =
                                DateTime.now().millisecondsSinceEpoch;
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            BlocProvider.of<StudentDataBloc>(context).add(
                                AddDataEvent(
                                    newModel: Model(
                                        name: nameController.text.toString(),
                                        currTime: currtime,
                                        gender: GenderValue,
                                        age: age),
                                    userId: pref.getString("uid")));
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("data added")));
                          setState(() {
                            nameController.text =
                                ""; // text field empty after action preformed

                            age = "";
                          });
                        },
                        child: Text("Submit")),
                  ),
                )
              ],
            )));
  }
}
