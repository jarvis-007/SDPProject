import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:demo_flutter2/service/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:demo_flutter2/models/todo.dart';



class CheckImage extends StatelessWidget {
  CheckImage();
  
  
  @override
  Widget build(BuildContext context) {
    Firestore x;
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckImage"),
      ),
      body:
      
          Image.asset('assets/b.jpg'),
        
      
      
    );
    
  }
 
}
 