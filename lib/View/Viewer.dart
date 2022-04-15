import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradeviwer/DTO/DTOUser.dart';

class Viewer extends StatefulWidget {
  final DTOUser UserId;
  Viewer(this.UserId);
  @override
  ViewerApp createState() => ViewerApp();
}
class ViewerApp extends State<Viewer>{
  @override
  validarUser(){

  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.UserId.nombreUser ),
        backgroundColor: const Color(0xFF00482B),
      ),
    ) ;
  }
}
