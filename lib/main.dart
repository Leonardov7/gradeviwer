import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '';
import 'View/DataInside.dart';
import 'View/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
   Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos App Línea 2',
      home: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF00482B),
          title: Text('Visor de calificaciones'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  width: 300,
                  child: Text("Este es un visor de calificadiones, "),
                ),
                Padding(
                  padding: EdgeInsets.all(10),

                ),
                Padding(padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(500,50),
                    primary: const Color(0xFF4E4B48),),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text('Ingresar'),
                ),
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(500,50),
                      primary: const Color(0xFF4E4B48),),
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DataInside()));
                    },
                    child: Text('Ingresar datos'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
