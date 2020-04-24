import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
import 'dart:async';
//import 'package:demo_flutter2/service/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:demo_flutter2/pages/viewriderequest.dart';
//import 'package:demo_flutter2/pages/HandleRideCancelled.dart';
import 'package:demo_flutter2/pages/AcceptedRides.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

//import 'package:demo_flutter2/service/authentication.dart';

String _userId;
String myreqid;
String rideid1;

class AcceptedRidesMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Accepted Ride Request'),
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
                          

                          child:
                              // mainAxisSize: MainAxisSize.min,
                              Card(
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
                                          'Arrival Time:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Departure Time:',
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
                                          'Spots Remaining:',
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

                                      child: const Text('View Accepted ride Requests',style:
                                              TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      //print('ret data is $retData');
                                       Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => new AcceptedRides(
                                                v6: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["rideid"]
                                                    .toString(),
                                              ioffspot:snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["spot"]
                                                    ,
                                                    )),
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

                          
                      }
                      );
                }
              })),
    );
  }

  Stream<QuerySnapshot> getAllCourses() {
    FirebaseAuth.instance.currentUser().then((user) {
      _userId = user.uid;
      //print(_userId);
    });
    // print(_userId);
    var firestore = Firestore.instance;
    //var firestore1 =firestore.collection('offerride').where('source',isEqualTo:v1).snapshots();
    Stream<QuerySnapshot> qn = firestore
        .collection('offerride')
        .where('userid', isEqualTo: _userId)
        .snapshots();
    //Stream<QuerySnapshot> qn1 =   firestore.collection('offerride').where(field).snapshots();
        
    // QuerySnapshot qn1=qn.isBroadcast();
    return qn;
  }
}
