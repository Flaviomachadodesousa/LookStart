// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_collection_literals, prefer_final_fields

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';
import 'package:lookstart/model/GameInfoModel.dart';

class GameInfo extends StatefulWidget {
  final int idgame;
  const GameInfo({Key key, @required this.idgame}) : super(key: key);

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
// GET INFO GAME ID
  List<Gameinfomodel> _game = List<Gameinfomodel>();

  Future<List<Gameinfomodel>> gameinformation(idgame) async {
    var url =
        'https://api.rawg.io/api/games/$idgame?key=e34347145e534d248d800b0b8f9547e9';
    var response = await http.get(Uri.parse(url));

    var game = List<Gameinfomodel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(utf8.decode(response.bodyBytes));
      var note2 = notesJson['results'];
      for (var note2 in note2) {
        game.add(Gameinfomodel.fromJson(note2));
      }
    }
    return game;
  }

  @override
  void initState() {
    int idgame = widget.idgame;
    gameinformation(idgame).then((value) {
      setState(() {
        _game.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Detalhes do game'),
        centerTitle: true,
        backgroundColor: Color(Constants.colorThemePurple),
      ),
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgroud.png"), fit: BoxFit.fill)),
        ),
      ]),
    );
  }
}
