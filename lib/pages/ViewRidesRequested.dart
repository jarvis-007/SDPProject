import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Message1.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:demo_flutter2/pages/Message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo_flutter2/pages/ViewDetailsViewRidesRequested.dart';
import 'package:demo_flutter2/pages/CancelRide.dart';
import 'package:demo_flutter2/pages/CancelPendingRide.dart';

String uid;
int seatRequested;

String requeststatus;

 String driverName,
                             departureTime,
                              freeSpots,
                              rperkm,
                              contactNumber;
                              String rideid;

                              var y1;
  //bool ans;
  int ans;
  Text offspot;
  int ioffspot;
  int bookspot;
  int finalans;
  String myrequestid;
  String requestid;
  
  //String pickup;

                             

class ViewRidesRequested extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      uid = user.uid;

      
    });


  return Scaffold(
      appBar: AppBar(
        title: Text("Rides Requested"),
      ),
      
      body:
      Column(children: <Widget>[
              
              Expanded(child:
                Container(
                  child:   StreamBuilder(
              stream: getAllRides(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("loading..."),
                  );
                }
                else if(snapshot.data.documents.length==0)
                {
                    return Center(child:Text("Sorry, No Rides Found.",style:TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),));
                }
                 else {
                  return ListView.builder(
      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                     // rideid=snapshot.data.documents[index].data["rideid"].toString();
                      
                       // print("rideid="+rideid);

                        return Container(
                            child: Card(
                                 margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                            color: Colors.blue[150],
                            elevation: 5,
                            child: Column(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,                              children: <Widget>[
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
                                              .data["pickupaddress"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["dropaddress"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          snapshot.data.documents[index]
                                              .data["pickuptime"].toString(),
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
                                              .data["status"].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      
                                      ],
                                    ),
                                    Column(),
                                    Column(),
                                  ],
                                ),

                
                         SizedBox(height:7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children:[
                        
                                  RaisedButton(
                                    child: const Text('Cancel', style:
                                              TextStyle(color: Colors.white)),
                                    onPressed: () {
                                      requestid=snapshot.data.documents[index].data["requestid"].toString();
                                      if(snapshot.data.documents[index].data["status"].toString()=="accepted")
                                      {
                                           Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => new CancelRide(
                                                rideid: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["rideid"]
                                                    .toString(),
                                                    numspot: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["spot"],
                                                    reqid:requestid,
                                                    )
                                                    ));
                                       //               Firestore.instance.collection("offerride").document(rideid).updateData({'spot':10});
                                      }
                                      else
                                      {
                                           Navigator.push(
                                            context,
                                              MaterialPageRoute(
                                                builder: (context) => new CancelPendingRide(
                                                    rideid: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["rideid"]
                                                    .toString(),
                                                    numspot: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["spot"],
                                                    reqid:requestid,
                                                    )
                                                    ));
                                      }
                                      
                                      }, color: Colors.black,
                                      highlightElevation: 1,
                                      elevation: 8,
                                      

                                  ),

                                RaisedButton(
                                    child: const Text('View Ride Details', style:
                                              TextStyle(color: Colors.white)),
                                    
                                    onPressed: () {
                                            Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => new ViewDetailsViewRidesRequested(
                                                rideid: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["rideid"]
                                                    .toString(),
                                                    status: snapshot
                                                    .data
                                                    .documents[index]
                                                    .data["status"]
                                                    .toString(),
                                                    pickup:snapshot.data.documents[index].data["pickupaddress"].toString(),
                                                    pickuptime:snapshot.data.documents[index].data["pickuptime"].toString(),
                                                    drop:snapshot.data.documents[index].data["dropaddress"].toString(),
                                                    spotrequest:snapshot.data.documents[index].data["spot"].toString(),
                                                    )
                                                    ),
                                                  
                                      );

                                     },
                                      color: Colors.black,
                                      highlightElevation: 1,
                                      elevation: 8,
                                     
                                  ),
                            

                          ]
                                ),

                                SizedBox(height:5),

                              //offspot=(Text(snapshot.data.documents[index].data["spot"].toString())),                              
                              //Text(ioffspot),
          
                              //ioffspot=snapshot.data.documents[index].data["spot"].toString(),

                            ],
                          ),
                        ));
                      });
                }
              })     
              


                ))
                


      ],)
      
      
    );

  }


Stream<QuerySnapshot> getAllRides() {
    var firestore = Firestore.instance;
    print("uid="+uid);
    Stream<QuerySnapshot> qn = firestore
        .collection('bookride')
        .where('userId', isEqualTo: uid)
        .snapshots();
        
    return qn;
  }

  Stream<QuerySnapshot> getAllOffers(String rideid) {
    var firestore = Firestore.instance;
    /*Stream<QuerySnapshot> qn = firestore
        .collection('offerride').where('rideid',isEqualTo:rideid).firestore.collection('bookride').where().snapshots();*/
    //return qn;
  }

  
/*void myofer(QuerySnapshot snapshot)
{
  snapshot.documents.where('spot', isGreaterThanOrEqualTo:5);
}
*/
}
