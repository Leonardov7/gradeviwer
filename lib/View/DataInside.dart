import 'package:flutter/material.dart';
//import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

class DataInside extends StatefulWidget {
  @override
  DataInsideApp createState() => DataInsideApp();
}

class DataInsideApp extends State<DataInside> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar Datos'),
      ),body: Container(
      child: ElevatedButton(
        onPressed: ()async{
          await _localPath;
        },
        child: Text('Cargar archivo'),
      ),
    ),
    );
  }
}
