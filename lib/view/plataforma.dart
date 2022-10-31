import 'package:flutter/material.dart';
import 'package:lookstart/constants.dart';
import 'package:lookstart/view/android.dart';
import 'package:lookstart/view/ios.dart';
import 'package:lookstart/view/nintendo.dart';
import 'package:lookstart/view/pc.dart';
import 'package:lookstart/view/ps4.dart';
import 'package:lookstart/view/ps5.dart';
import 'package:lookstart/view/xbox_one.dart';
import 'package:lookstart/view/xboxsx.dart';

class Plataforma extends StatefulWidget {
  const Plataforma({Key key}) : super(key: key);

  @override
  State<Plataforma> createState() => _PlataformaState();
}

class _PlataformaState extends State<Plataforma> {
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
        GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              InkWell(
                onTap: () {
                  // ignore: avoid_print
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Android()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                Constants.android),
                              fit: BoxFit.cover,
                            )))),
              ),
              InkWell(
                onTap: () async {
                  // ignore: avoid_print
                  print('IOS');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ios()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.ios),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
              )),
              ),
              InkWell(
                onTap: () async {
                  // ignore: avoid_print
                  print('PS4');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ps4()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.ps4),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
              InkWell(
                onTap: () async {
                  // ignore: avoid_print
                  print('PS5');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ps5()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.ps5),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
              InkWell(
                onTap: () async {
                  //Constants.snackbarpage('estamos em contrução', context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Nintendo()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image:
                                AssetImage(Constants.nintendo),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
              InkWell(
                onTap: () async {
                  //Constants.snackbarpage('estamos em contrução', context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Pc()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.pc),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const XboxSX()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.xboxx),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
               InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const XboxOne()),
                  );
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    shadowColor: Colors.black,
                    elevation: 6,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(Constants.xboxs),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        )),
              ),
            ])]));
  }
}
