import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter2/pages/Message1.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:demo_flutter2/pages/Message.dart';


//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
//import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';





class LimitExeeded extends StatelessWidget {
LimitExeeded();
@override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Limit Exeeded"),
      ),
      body:Center(child:Text("Ride Seat Limit Exeeded",style:TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),)),
      );
        
     
      

}
}

