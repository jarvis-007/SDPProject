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



class ViewDetailsViewRidesRequested extends StatelessWidget {
  ViewDetailsViewRidesRequested({this.rideid,this.status,this.pickup,this.pickuptime,this.spotrequest,this.drop});
  
  String rideid;
  String status;

 String pickup;
  String pickuptime;
  String drop;
  String spotrequest;


QuerySnapshot qn1;


DataSnapshot map;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Ride Details"),
      ),
      body:
      Column(children: <Widget>[
Expanded(
 child: Container(
          child:StreamBuilder(
              stream: getAllOffers(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("loading..."),
                  );
                } 
                else if(snapshot.data.documents.length==0)
                {
                    return Center(child:Text("Sorry, No Record Found.",style:TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),));
                }else {
                  return ListView.builder(
      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                        //bookspot=snapshot.data.documents[index].data["spot"];
                        //myrequestid=snapshot.data.documents[index].data["spot"];
                        
                          return Container(
                            child: Card(


                               margin: EdgeInsets.fromLTRB(2, 250, 2, 2),
                            color: Colors.blue[100],
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
                                          'Date Of Journey:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Free Spots Left:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Rate Per Km:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Vehicle Description',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Vehicle Number:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Driver Name:',
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
                                          'Drop Adrdess:',
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
                                          'Spots Requested',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Request Status:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      



                                        status=='accepted'?Text(
                                          'Contact Number:',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                          ):Text('')
                                        
                                        
                                      
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
                                              .data["date"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["spot"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["cost"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["description"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["number"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["driverName"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),

                                        Text(
                                          pickup,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          drop,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          pickuptime,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          spotrequest,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          status,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),




                                        status=='accepted'?Text(
                                          snapshot.data.documents[index]
                                              .data["contactNumber"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ):Text(''),
                                      
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
  

  Stream<QuerySnapshot> getAllOffers()
   {
    var firestore = Firestore.instance;
    Stream<QuerySnapshot> qn = firestore
        .collection('offerride')
        .where('rideid', isEqualTo: rideid)
        .snapshots();
    return qn;
  }
/*void myofer(QuerySnapshot snapshot)
{
  snapshot.documents.where('spot', isGreaterThanOrEqualTo:5);
}
*/
}
 