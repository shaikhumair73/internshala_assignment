import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment/Method/fetch_data_method.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';
import 'package:meta/meta.dart';

part 'student_data_event.dart';
part 'student_data_state.dart';

class StudentDataBloc extends Bloc<StudentDataEvent, StudentDataState> {
  StudentDataBloc() : super(StudentDataInitial()) {
    //data add on firestore
    on<AddDataEvent>((event, emit) async {
      try {
        emit(StudentDataLoading());
        var firestore = FirebaseFirestore.instance
            .collection("users")
            .doc(event.userId)
            .collection("notes");
        await firestore.add(event.newModel!.toMap()).then((value) {
          print("value added");
          // setState(() {});
        });
        var listData = await fetchData(event.userId!);
        // List<Model>data insinde mdata
        emit(StudentDataLoaded(mdata: listData));
      } catch (e) {
        print("error is ${e}");
      }
    });
    // data fetch on screen
    on<FetchDataEvent>((event, emit) async {
      try {
        //loading state show
        emit(StudentDataLoading());
        // userid is login id
        var listData = await fetchData(event.userId!);
        // List<Model>data insinde mdata
        emit(StudentDataLoaded(mdata: listData));
      } catch (e) {
        print("error is ${e}");
      }
    });
  }
}
