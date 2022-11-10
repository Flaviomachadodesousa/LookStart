// ignore_for_file: prefer_final_fields, prefer_collection_literals, deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';
import 'package:lookstart/view/favoritos.dart';
import 'package:lookstart/view/plataforma.dart';
import 'package:lookstart/view/procurar.dart';
import 'package:lookstart/view/topgames.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    TopGames(),
    Plataforma(),
    Procurar(),
    Favoritos()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('LookStart'),
          centerTitle: true,
          backgroundColor: Color(Constants.colorThemePurple),
        ),
        body: _telas[_indiceAtual],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10), topLeft: Radius.circular(10)),
              boxShadow: const [
                BoxShadow(
                    color: Colors.transparent, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Color(Constants.colorThemePurple),
                type: BottomNavigationBarType.fixed,
                currentIndex: _indiceAtual,
                onTap: onTabTapped,
                // ignore: prefer_const_literals_to_create_immutables
                items: [
                  BottomNavigationBarItem(
                      activeIcon: Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 32,
                      ),
                      icon: Icon(Icons.home),
                      title: Text("Inicio",
                          style: TextStyle(color: Colors.white))),
                  BottomNavigationBarItem(
                      activeIcon:
                          Icon(Icons.gamepad, color: Colors.orange, size: 32),
                      icon: Icon(Icons.gamepad),
                      title: Text("Plataformas",
                          style: TextStyle(color: Colors.white))),
                  BottomNavigationBarItem(
                      activeIcon:
                          Icon(Icons.search, color: Colors.green, size: 32),
                      icon: Icon(Icons.search),
                      title: Text("Procurar",
                          style: TextStyle(color: Colors.white))),
                  BottomNavigationBarItem(
                      activeIcon:
                          Icon(Icons.favorite, color: Colors.red, size: 32),
                      icon: Icon(Icons.favorite),
                      title: Text("Favoritos",
                          style: TextStyle(color: Colors.white))),
                ],
              ),
            )));
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
