import 'package:flutter/material.dart';

import 'Screen/homeScreen.dart';

void main(){
  runApp(
      MyMaterial()
  );
}

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  State<MyMaterial> createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      home: HomePage(),
    );
  }
}