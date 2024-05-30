class Model {
  String? name; // student name
  String? age; // student age
  String? gender; // student gender
  int? currTime; // time where data add
  // Map to Model
  Model(
      {required this.name,
      required this.currTime,
      required this.gender,
      required this.age});
  factory Model.fromMap(Map<String, dynamic> map) {
    return Model(
        name: map["name"],
        currTime: map["currTime"],
        gender: map["gender"],
        age: map["age"]);
  }
  // Model to Map
  Map<String, dynamic> toMap() {
    return {"name": name, "age": age, "gender": gender, "currTime": currTime};
  }
}
