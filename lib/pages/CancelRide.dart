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



class CancelRide extends StatelessWidget {
  CancelRide({this.rideid,this.numspot,this.reqid});
  int numspot;
  String rideid;
  String reqid;
  
  int ans;
  Text offspot;
  int ioffspot;
  int bookspot;
  int temp;
  var finalans;
  String myrequestid;

QuerySnapshot qn1;


DataSnapshot map;

  @override
  Widget build(BuildContext context) {
    Firestore x;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cancle Ride"),
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
                    return Center(child:Text("Request Cancelled Sucessfully.",style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),));
                }
                 else {
                  return ListView.builder(
      itemCount: 1,
                      itemBuilder: (_, index) {
                          temp=snapshot.data.documents[index].data["spot"];
                           Firestore.instance.collection('offerride').document(rideid).updateData({'spot':finalans});
                            Firestore.instance.collection('bookride').document(reqid).delete();
                          addme();
                        // Firestore.instance.collection('offerride').document(rideid).updateData({'spot':finalans});
                          
                       //print("temp"+temp);
                         // temp=0;
                          return Column(
children: <Widget>[
  SizedBox(height:300),
                        Center(child:Text("Request Cancelled Successfully",style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),)

],
                        );
                       
                              //Text("Request Cancelled Successfully",style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                           //   x.instance.collection('offerride').document(rideid).updateData({'spot':snapshot.data.documents[index].data["spot"]+numspot});
                              
                          //    Text((temp).toString()),
                         // Text("Your Ride Has Been Cancelled Sucessfully"),
                          
                              //}
                         // x.instance.collection('offerride').document(rideid).updateData({'spot':x});
                      });
                }
              }),
)),
              
    /*          Expanded(child:
                Container(
                  child:   StreamBuilder(
              stream: getAllOffers(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("loading..."),
                  );
                } else {
                  return ListView.builder(
      itemCount: snapshot.data.documents.length,
                      itemBuilder: (_, index) {
                        ioffspot=snapshot.data.documents[index].data["spot"];
                        return Container(
                            child: Card(
                                child: InkWell(
                          onTap: () {
                },
                
                          child: Column(
                            
                            children: <Widget>[
                              
                        


                              //offspot=(Text(snapshot.data.documents[index].data["spot"].toString())),                              
                              //Text(ioffspot),
          
                              //ioffspot=snapshot.data.documents[index].data["spot"].toString(),

                            ],
                          ),
                        )));
                      });
                }
              })     
              


                ))*/

      ],)
      
      
    );
    
  }
  Stream<QuerySnapshot> getAllCourses() {
    var firestore = Firestore.instance;
    Stream<QuerySnapshot> qn = firestore
        .collection('offerride')
        .where('rideid', isEqualTo: rideid)
        .snapshots();
  print("len");
        print(qn.length);
  return qn;
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
  void addme()
  {
    finalans=temp+numspot;
    print(finalans);    
  }
/*void myofer(QuerySnapshot snapshot)
{
  snapshot.documents.where('spot', isGreaterThanOrEqualTo:5);
}
*/
}
 