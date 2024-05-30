part of 'student_data_bloc.dart';

@immutable
abstract class StudentDataEvent {}

class AddDataEvent extends StudentDataEvent {
  Model? newModel; // Student data Model
  String? userId; // login id every teachers have own login if
  AddDataEvent({required this.newModel, required this.userId});
}

class FetchDataEvent extends StudentDataEvent {
  String? userId;
  FetchDataEvent({required this.userId});
}
