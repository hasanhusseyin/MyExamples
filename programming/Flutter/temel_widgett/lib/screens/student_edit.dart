import 'package:flutter/material.dart';
import '../models/student.dart';
import '../validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student ? selecectedStudent;
  StudentEdit(Student selecectedStudent){
    this.selecectedStudent=selecectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selecectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student ? selecectedStudent;
  var formKey=GlobalKey<FormState>();

  _StudentAddState(Student ? selecectedStudent){
    this.selecectedStudent=selecectedStudent;
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
      initialValue: selecectedStudent!.firstName,
      decoration: InputDecoration(labelText: "Adı", hintText: "İsim Girin"),
      validator: validateFirstName,
      onSaved: (String? value) {
        selecectedStudent!.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selecectedStudent!.lastName,
      decoration: InputDecoration(labelText: "Soyadı", hintText: "Soyad Girin"),
      validator: validateLastName,
      onSaved: (String? value) {
        selecectedStudent!.lastName = value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      initialValue: selecectedStudent!.grade.toString(),
      decoration: InputDecoration(labelText: "Notu", hintText: "Not Girin"),
      validator: validateGrade,
      onSaved: (String ? value) {
        selecectedStudent!.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton( child: Text("Kaydet"),
      onPressed:(){
        if(formKey.currentState!.validate()){
          formKey.currentState?.save();
          saveStudent();
          Navigator.pop(context);
        }
      } ,
    );
  }

  void saveStudent() {
    print(selecectedStudent!.firstName);
    print(selecectedStudent!.lastName);
    print(selecectedStudent!.grade);
  }
}
