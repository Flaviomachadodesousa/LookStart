// ignore_for_file: avoid_unnecessary_containers, deprecated_member_use, prefer_collection_literals, prefer_final_fields, missing_return

import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
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

  Future<Gameinfomodel> fetchNotes(idgame) async {
    var url =
        'https://api.rawg.io/api/games/$idgame?key=e34347145e534d248d800b0b8f9547e9';
    var response = await http.get(Uri.parse(url));

    var notesJson = json.decode(response.body);

    return Gameinfomodel.fromJson(notesJson);
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
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
            height: media.height,
            width: media.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/backgroud.png"),
                    fit: BoxFit.fill)),
          ),
          FutureBuilder<Gameinfomodel>(
              future: fetchNotes(widget.idgame),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(
                      child: Column(children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SizedBox(
                          height: media.height / 3.5,
                          width: media.width,
                          child: CarouselSlider(
                            items: [
                              Container(
                                margin: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        snapshot.data.backgroundImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  image: DecorationImage(
                                    image: NetworkImage(snapshot
                                        .data.backgroundImageAdditional),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                            options: CarouselOptions(
                              height: 400.0,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 900),
                              viewportFraction: 0.8,
                            ),
                          ),
                        )),
                    Flexible(
                        child: Container(
                            decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white54,
                    )))
                  ]));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })

          /*FutureBuilder(
            future: fetchNotes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data[index].name),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )*/
        ]));
  }
}
