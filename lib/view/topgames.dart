// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';
import 'package:lookstart/model/GameModel.dart';
import 'package:lookstart/view/game_info.dart';

class TopGames extends StatefulWidget {
  const TopGames({Key key}) : super(key: key);

  @override
  State<TopGames> createState() => _TopGamesState();
}

class _TopGamesState extends State<TopGames> {
// GET PLATFORMS
  List<GameModel> _notes = List<GameModel>();

  Future<List<GameModel>> fetchNotes() async {
    var url = Constants.urltopgames;
    var response = await http.get(Uri.parse(url));

    var notes = List<GameModel>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(utf8.decode(response.bodyBytes));
      var note2 = notesJson['results'];
      //print(note2);
      for (var note2 in note2) {
        notes.add(GameModel.fromJson(note2));
      }
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgroud.png"), fit: BoxFit.fill)),
        ),
        FutureBuilder(
            future: fetchNotes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Image.asset(
                      "assets/loading.gif",
                      fit: BoxFit.fill,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                  ),
                );
              } else {
                return Column(children: <Widget>[
                  const Padding(
                    padding:
                        EdgeInsets.all(15), //apply padding to all four sides
                    child: Text(
                      'Top Games',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
                    itemCount: _notes.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            print("Container clicked");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GameInfo(
                                    idgame: snapshot.data[index].id,
                                  ),
                                ));
                          },
                          child: Card(
                              elevation: 4.0,
                              clipBehavior: Clip.antiAlias,
                              semanticContainer: true,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        snapshot.data[index].name,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                      subtitle: Text(
                                        '\u2605 ' +
                                            snapshot.data[index].rating
                                                .toString() +
                                            '/5',
                                        style: const TextStyle(
                                            color: Colors.amber),
                                      ),
                                      //trailing:Icon(Icons.star),
                                    ),
                                    Container(
                                      height: 106,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  snapshot.data[index]
                                                      .backgroundImage),
                                              fit: BoxFit.fill)),
                                    ),
                                  ])));
                    },
                  ))
                ]);
              }
            }),
      ]),
    );
  }
}
