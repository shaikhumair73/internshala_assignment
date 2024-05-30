import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internshala_assignment/Models/Student_detail_model.dart';

// method for fetching notes and add on List
Future<List<Model>> fetchData(String userId) async {
  List<Model> studentData = [];
  // try catch bloc used for error handling
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("users")
        .doc(userId)
        .collection("notes")
        .orderBy("currTime", descending: true)
        .get();
    //doc= QuerySnapshot<Map<String, dynamic>> data come in map so map olaced on each index of list
    querySnapshot.docs.forEach((doc) {
      studentData.add(Model.fromMap(doc.data()));
    });
  } catch (e) {
    print("error ${e}");
  }
  return studentData;
}
