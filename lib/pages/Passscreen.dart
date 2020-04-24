import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:demo_flutter2/pages/Requestride.dart';

class Passscreen extends StatelessWidget {
  Passscreen({this.v1, this.v2, this.v3, this.v4});
  String v1;
  final String v2;
  final String v3;
  String v6;
   String v7;
  int v4;
  int v4x;
  //bool ans;
  int ans;

  Stream<QuerySnapshot> getAllCourses() {
    //v4x=int.parse(v4);
    var firestore = Firestore.instance;
    //var firestore1 =firestore.collection('offerride').where('source',isEqualTo:v1).snapshots();
    Stream<QuerySnapshot> qn = firestore
        .collection('offerride')
        .where('source', isEqualTo: v1)
        .where('destination', isEqualTo: v2)
        .where('date', isEqualTo: v3)
        .where('spot', isGreaterThanOrEqualTo: v4)
        .snapshots();
    //Stream<QuerySnapshot> qn1 =   firestore.collection('offerride').where(field).snapshots();

    // QuerySnapshot qn1=qn.isBroadcast();
    return qn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awailable Rides"),
      ),
      body: new Container(
          child: StreamBuilder(
              stream: getAllCourses(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("loading..."),
                  );
                } 
                else if(snapshot.data.documents.length==0)
                {
                    return Center(child:Text("Sorry, No Rides Found.",style:TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),));
                }else {
                  return ListView.builder(
//                     padding: const EdgeInsets.all(8),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                        return Container(
                           
                           child:Card(
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
                                          'Source:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Destination:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'ArrivalTime:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'DepartureTime:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Date:',
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
                                              .data["source"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["destination"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["Arrivaltime"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["departuretime"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["date"],
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

                                // height: 50,                         color: Colors.amber[colorCodes[index]],
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RaisedButton(


                                      child: const Text('Book A Ride',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      
                                         Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => new Example3(
                                                v6: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["rideid"]
                                                    .toString(),v7:v4)),
                                      );
                                    
                                
                                    },


                                      
                                      
                                      color: Colors.black,
                                      highlightElevation: 1,
                                      elevation: 8,
                                    ),
                                
                                  ],
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),

                            
                        );
                        
                      });
                }
              })),
    );
  }
}
