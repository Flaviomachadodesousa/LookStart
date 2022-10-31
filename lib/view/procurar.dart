import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';

class Procurar extends StatefulWidget {
  const Procurar({ Key key }) : super(key: key);

  @override
  State<Procurar> createState() => _ProcurarState();
}

class _ProcurarState extends State<Procurar> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Scaffold(
          appBar: AppBar(
            backgroundColor: Color(Constants.colorThemePurple),
            centerTitle: true,
            title: const Text('Procurar'),
          ),
          body: Container(color: Colors.amber,)
    );
  }
}