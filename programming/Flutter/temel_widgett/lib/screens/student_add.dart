import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student> ? students;
  StudentAdd(List<Student> students){
    this.students=students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students!);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  List<Student> ? students;
  var student = Student.withoutInfo();
  var formKey=GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students=students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
            key:formKey,
            child: Column(
              children: [
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Adı", hintText: "İsim Girin"),
      validator: validateFirstName,
      onSaved: (String? value) {
        student.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Soyadı", hintText: "Soyad Girin"),
      validator: validateLastName,
      onSaved: (String? value) {
        student.lastName = value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Notu", hintText: "Not Girin"),
      validator: validateGrade,
      onSaved: (String ? value) {
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton( child: Text("Kaydet"),
      onPressed:(){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          students!.add(student);
          saveStudent();
          Navigator.pop(context);
        }
      } ,
    );
  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
