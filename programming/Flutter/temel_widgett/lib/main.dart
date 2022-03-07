import 'package:flutter/material.dart';
import 'package:temel_widgett/models/student.dart';
import 'package:temel_widgett/screens/student_add.dart';
import 'package:temel_widgett/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = " İLK UYGULAMA MERHABA";

  String baslik = "Öğrenci Takip Sistemi";

  Student selectedOgrenci =Student.withId(0, "", "" ,0 );
  List<Student> students = [
    new Student.withId(1,"Hasan", "Demirtaş", 45),
    new Student.withId(2,"fatma", "Demirtaş", 65),
    new Student.withId(3,"irfan", "Demirtaş", 35)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(baslik),
        ),
        body: buildBody(context));
  }
  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://www.kindpng.com/picc/m/364-3640737_avatar-snapchat-hd-png-download.png"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text("Sınavdan Aldığı Not : " +
                        students[index].grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildsStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedOgrenci = students[index];
                      });
                      print(students[index].firstName +
                          " " +
                          students[index].lastName);
                    },
                  );
                })),
        Text("Seçili Öğrenci : " + selectedOgrenci.firstName),
        Row(children: [
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text("Ekle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              )),
          Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.grey,
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedOgrenci)));
                },
              )), Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedOgrenci);
                  });

                  var mesage ="Silindi : "+ selectedOgrenci.firstName;
                  mesajGoster(context, mesage);
                },
              )),
        ]),
      ],
    );
  }

  Widget buildsStatusIcon(int grade) {
    if (grade >= 50)
      return Icon(Icons.done);
    else if (grade < 50) return Icon(Icons.clear);
    return Icon(Icons.info);
  }
}
