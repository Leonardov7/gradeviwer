import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gradeviwer/DTO/DTOUser.dart';
import 'package:gradeviwer/View/Viewer.dart';

class Login extends StatefulWidget {
  //cambia dinámicamente
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String rol = 'usuario';
  DTOUser usuarioObj=DTOUser();

  validarDatos() async {
    bool flag = false;
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection("User");
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        for (var cursor in usuario.docs) {
          if (user.text == cursor.get('User')) {
            if (pass.text == cursor.get('Pass')) {
              usuarioObj.nombreUser=cursor.get('Nombre');
              mensajeInput('Mensaje', 'Usuario Encontrado', usuarioObj);
              flag = true;
            }
          }
          //print(cursor.get('User'));
        }
        if (!flag) mensaje("Ingreso", 'Error en las credenciales');
      }
    } catch (e) {
      mensaje('Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    /*setState(() {
      biometrico();
    });*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: const Color(0xFF00482B),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Image.asset('image/img.png'),
                    // child: Text('Login'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Correo',
                  hintText: 'Digite su correo institucional',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Documento',
                  hintText: 'Digite documento de identidad',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                  primary: const Color(0xFF4E4B48),
                ),
                onPressed: () {
                  validarDatos();

                  //pass.clear();
                  //mensaje('Este es un título', 'Este es un mensaje');
                },
                child: Text('Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mensajeInput(String titulo, String mess, DTOUser UserObj) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Viewer(UserObj)));
                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }

  void mensaje(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
}
