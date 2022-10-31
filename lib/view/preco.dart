import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';

class Preco extends StatefulWidget {
  const Preco({ Key key }) : super(key: key);

  @override
  State<Preco> createState() => _PrecoState();
}

class _PrecoState extends State<Preco> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Scaffold(
          /*appBar: AppBar(
            backgroundColor: Color(Constants.colorThemePurple),
            centerTitle: true,
            title: const Text('Preço'),
          ),*/
          body: Container(color: Colors.amber,)
    );
  }
}