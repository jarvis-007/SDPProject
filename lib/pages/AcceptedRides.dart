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
//import 'package:demo_flutter2/pages/LimitExeeded.dart';



class AcceptedRides extends StatelessWidget {
  AcceptedRides({this.v6,this.ioffspot});
  
  String v1;
  String v6;
   String v7;
  String v4;
  //String v9;
  var y1;
  //bool ans;
  int ans;
  Text offspot;
  int ioffspot;
  int bookspot;
  int finalans;
  String myrequestid;
//Message ans1=new Message();
                             /* var firebase;
          var db = firebase.firestore();
      db.collection('offerride')
   .where('rideid',isEqualTo:v6)
   .update({
     'spot': '666',
   });*/

QuerySnapshot qn1;


DataSnapshot map;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accepted Ride Request"),
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
                    return Center(child:Text("Sorry, No Accepted Requests Found.",style:TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),));
                } else {
                  return ListView.builder(
      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                        //bookspot=snapshot.data.documents[index].data["spot"];
                        //myrequestid=snapshot.data.documents[index].data["spot"];
                        return Container(
                            child: Card(

                            margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            color: Colors.blue[150],
                            elevation: 5,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(),
                                    Column(),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          'Name:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Gender:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Pick Up Address:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Drop Address:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Pick Up Time:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Spots Requested:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["name"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["gender"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["pickupaddress"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["dropaddress"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["pickuptime"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["spot"]
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(),
                                    Column(),
                                  ],
                                ),
                             ],
                            ),
                        ));
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
        .where('rideid', isEqualTo: v6).where('status', isEqualTo: 'accepted')
        .snapshots();
  return qn;
  }

  Stream<QuerySnapshot> getAllOffers()
   {
    var firestore = Firestore.instance;
    Stream<QuerySnapshot> qn = firestore
        .collection('offerride')
        .where('rideid', isEqualTo: v6)
        .snapshots();
    return qn;
  }
/*void myofer(QuerySnapshot snapshot)
{
  snapshot.documents.where('spot', isGreaterThanOrEqualTo:5);
}
*/
}
 