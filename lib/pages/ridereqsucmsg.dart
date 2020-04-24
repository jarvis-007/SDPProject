//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:demo_flutter2/pages/Search.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';
//import 'dart:async';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';





class RideReqSuc extends StatelessWidget {
RideReqSuc({this.v9});
String v9;
 @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Confirmation"),
      ),
      body:Center(child:Text("Ride Request Has Been Sent Successfully.",style:TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),)),
      );
        
     
      

}
}