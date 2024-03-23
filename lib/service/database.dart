import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods{
  Future addtache(
      Map<String, dynamic> TacheInfoMaP, String id)async{
    return await FirebaseFirestore.instance
        .collection("tache")
        .doc(id)
        .set(TacheInfoMaP);
  }
  
  Future<Stream<QuerySnapshot>> getTache() async{
    return await FirebaseFirestore.instance.collection("tache").snapshots();
  }

  Future updateTache(String id, Map<String, dynamic> updateInfo) async{
    return await FirebaseFirestore.instance.collection("tache").doc(id).update(updateInfo);
  }

  Future deleteTache(String id) async{
    return await FirebaseFirestore.instance.collection("tache").doc(id).delete();
  }
}