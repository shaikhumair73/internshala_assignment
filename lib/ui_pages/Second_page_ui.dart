import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment/Bloc/student_data_bloc.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';

class My_Page extends StatefulWidget {
  String? uid; // login id
  My_Page({required this.uid});
  @override
  State<My_Page> createState() => _My_PageState();
}

class _My_PageState extends State<My_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<StudentDataBloc>(context).add(FetchDataEvent(
        userId: widget
            .uid)); // fetch data on screen when open app firstly show data
    // on screen using init state method
  }

  //const My_Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: ,
        title: Text("Student Detail"),
      ),
      body: BlocBuilder<StudentDataBloc, StudentDataState>(
          // Bloc builder is use when use bloc state Management
          builder: (context, state) {
        if (state is StudentDataLoading) {
          return CircularProgressIndicator(); // circular progress indicator show on screen
        } else if (state is StudentDataLoaded) {
          var data = state.mdata; // List<Model> data
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height *
                        0.08, // Media-query making ui responsive
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xffB81736),
                          Color(0xff281537),
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Text(
                        "${data[index].name}",
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        "${data[index].age}",
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        "${data[index].gender}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                );
              });
        }
        return Container();
      }),
    );
  }
}
