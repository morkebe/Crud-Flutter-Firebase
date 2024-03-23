import 'package:first/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';


class Tache extends StatefulWidget {
  const Tache({super.key});

  @override
  State<Tache> createState() => _TacheState();
}

class _TacheState extends State<Tache> {
  TextEditingController titreController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController debutController = new TextEditingController();
  TextEditingController finController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Formulaire",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold ),),
            Text(
              "des",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold ),),
            Text(
              "Taches",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 29.0,
                  fontWeight: FontWeight.bold ),),
          ],),),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, top: 30.0,right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Titre",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: titreController,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 18.0,),
            Text(
              "Description",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 18.0,),
            Text(
              "Date de debut",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: debutController,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 18.0,),
            Text(
              "Date de fin",
              style: TextStyle(
                color: Colors.black,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: finController,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),
              ),
            ),
            SizedBox(height: 30.0,),
            Center(
              child: ElevatedButton(onPressed: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> TacheInfoMaP={
                  "id": id,
                  "Titre": titreController.text,
                  "Description": descriptionController.text,
                  "Debut": debutController.text,
                  "Fin": finController.text,
                };
                await DatabaseMethods().addtache(TacheInfoMaP, id).then((value) {
                  Fluttertoast.showToast(
                      msg: "reussi",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                } );
              }, child: Text(
                "Enregistrer",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              )),
            )
          ],
        ),
      ),
    );
  }
}
