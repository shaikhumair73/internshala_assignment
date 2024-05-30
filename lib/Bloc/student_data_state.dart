part of 'student_data_bloc.dart';

@immutable
abstract class StudentDataState {}

class StudentDataInitial extends StudentDataState {}

//loading state
class StudentDataLoading extends StudentDataState {}

//loaded state
class StudentDataLoaded extends StudentDataState {
  List<Model> mdata = [];
  StudentDataLoaded({required this.mdata});
}

//error state
class StudentDataError extends StudentDataState {
  String? error;
  StudentDataError({required this.error});
}
