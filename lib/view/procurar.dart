// ignore_for_file: prefer_collection_literals, deprecated_member_use, prefer_final_fields, unused_local_variable

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'package:lookstart/model/GameModel.dart';

class Procurar extends StatefulWidget {
  const Procurar({Key key}) : super(key: key);

  @override
  State<Procurar> createState() => _ProcurarState();
}

class _ProcurarState extends State<Procurar> {
  TextEditingController search = TextEditingController();

  List<GameModel> _notes = List<GameModel>();

  Future<List<GameModel>> fetchNotes(search) async {
    var url =
        'https://api.rawg.io/api/games?key=e34347145e534d248d800b0b8f9547e9&search=$search';
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
    fetchNotes(search).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }

  Future<GameModel> insert(search) {
    fetchNotes(search).then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
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
      Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: search,
                  decoration: InputDecoration(
                    hintText: "Procurar",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      onPressed: () {
                        insert(search.text);
                        search.clear();
                        setState(() {});
                        //CONSULTAR
                        //https://www.youtube.com/watch?v=YOzCwuau-Xo
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: _notes.length == 0
                      ? GridView.builder(
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
                                },
                                child: Card(
                                    elevation: 4.0,
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: const [
                                          ListTile(
                                            title: Text(
                                              'NADA MAIS TEM',
                                              /*
                                        snapshot.data[index].name,*/
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              '\u2605 ' +
                                                  //snapshot.data[index].rating
                                                  //    .toString() +
                                                  'nada mais tem' +
                                                  '/5',
                                              style: TextStyle(
                                                  color: Colors.amber),
                                            ),
                                            //trailing:Icon(Icons.star),
                                          ),
                                        ])));
                          },
                        )
                      : GridView.builder(
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
                                },
                                child: Card(
                                    elevation: 4.0,
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              _notes[index].name,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            subtitle: Text(
                                              '\u2605 ' +
                                                  _notes[index]
                                                      .rating
                                                      .toString() +
                                                  '/5',
                                              style: const TextStyle(
                                                  color: Colors.amber),
                                            ),
                                            //trailing:Icon(Icons.star),
                                          ),
                                          Container(
                                            height: 96,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                image: DecorationImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            _notes[index]
                                                                .backgroundImage),
                                                    fit: BoxFit.fill)),
                                          ),
                                        ])));
                          },
                        ))
            ],
          )),
    ]));
  }
}
              /*
              Expanded(
                child: _notes.length == 0
                    ? ListView.builder(
                        itemCount: _notes.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      offset: Offset(2, 2))
                                ]),
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Post",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Container(
                                  height: 2,
                                ),
                                const Text('NADA::::::::::::fullData[index]')
                              ],
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _notes.length,
                        itemBuilder: (context, int index) {
                          return Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: 2,
                                      offset: Offset(2, 2))
                                ]),
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Post",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Container(
                                  height: 2,
                                ),
                                const Text('TEM COISA')
                              ],
                            ),
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
*/