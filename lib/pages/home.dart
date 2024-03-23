import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first/pages/tache.dart';
import 'package:first/service/database.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController titreController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  TextEditingController debutController = new TextEditingController();
  TextEditingController finController = new TextEditingController();

  Stream? TacheDetail;

  getontheload() async{
    TacheDetail= await DatabaseMethods().getTache();
    setState(() {

    });
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allTache(){
    return StreamBuilder(
      stream: TacheDetail,
      builder: (context, AsyncSnapshot snapshot){

      return snapshot.hasData
          ? ListView.builder(
        itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index){
          DocumentSnapshot ds = snapshot.data.docs[index];
          return

            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Titre: "+ds["Titre"],
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),),
                          Spacer(),
                          GestureDetector(
                            onTap: (){
                              titreController.text = ds["Titre"];
                              descriptionController.text = ds["Description"];
                              debutController.text = ds["Debut"];
                              finController.text = ds["Fin"];
                              EditTache(ds["id"]);
                            },
                              child: Icon(Icons.edit, color: Colors.orange,)),
                          SizedBox(width: 5.0,),
                          GestureDetector(
                            onTap: () async {
                              await DatabaseMethods().deleteTache(ds["id"]);
                            },
                              child: Icon(Icons.delete, color: Colors.red,))
                        ],

                      ),
                      Text("Description: "+ds["Description"],
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),),
                      Text("date debut: "+ds["Debut"],
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),),
                      Text("date fin: "+ds["Fin"],
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),)



                    ],
                  ),
                ),
              ),
            );

          })
          :Container();
    }, );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Tache() ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gestion",
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
        margin: EdgeInsets.only(left: 20.0,right: 20.0,top: 30.0),
        child: Column(
          children: [
            Expanded(child: allTache()),
          ],
        ),
      ),
    );
  }

  Future EditTache(String id ) =>showDialog(context: context, builder: (context)=>AlertDialog(

    content: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: ()
                  {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel)),
              SizedBox(width: 60.0),
              Text(
                "Modifier",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 29.0,
                    fontWeight: FontWeight.bold ),),

            ],
          ),
          SizedBox(height: 20.0,),
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
          SizedBox(height: 20.0,),
          Center(child: ElevatedButton(onPressed: () async{
            Map<String, dynamic>updateInfo={
             "Titre": titreController.text,
             "Description": descriptionController.text,
             "Debut": debutController.text,
             "Fin": finController.text,
             "id": id,
            };
            await DatabaseMethods().updateTache(id, updateInfo).then((value) {
              Navigator.pop(context);
            });
          },
              child: Text("Modifier")),)
        ],
      ),
    ),
  ));

}
