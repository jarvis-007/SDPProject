import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Message1.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:demo_flutter2/pages/Message.dart';



class HandleRideCancelled extends StatelessWidget {
  HandleRideCancelled({this.rideid});
  
  String rideid;
  String reqid;
  
QuerySnapshot qn1;


DataSnapshot map;

  @override
  Widget build(BuildContext context) {
    Firestore x;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Cancelled"),
      ),
      body:
      Column(children: <Widget>[
Expanded(
 child: Container(
          child:StreamBuilder(
              stream: getAllCourses(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("loading..."),
                  );
                }
                else if(snapshot.data.documents.length==0)
                {
                    return Center(child:Text("Ride Cancelled Successfully.",style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),));
                } else {
                  return ListView.builder(
      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                          reqid=snapshot.data.documents[index].data["requestid"];
                           Firestore.instance.collection('bookride').document(reqid).updateData({'status':'Ride Cancelled'});
                          
                        // Firestore.instance.collection('offerride').document(rideid).updateData({'spot':finalans});
                          
                       //print("temp"+temp);
                         // temp=0;
                        //return Text("ride cancelled");
                         // x.instance.collection('offerride').document(rideid).updateData({'spot':x});
                      });
                }
              }),
)),
              
  
      ],)
      
      
    );
    
  }
  Stream<QuerySnapshot> getAllCourses() {
    var firestore = Firestore.instance;
    Stream<QuerySnapshot> qn = firestore
        .collection('bookride')
        .where('rideid', isEqualTo: rideid)
        .snapshots();
  
  return qn;
  }

}
 