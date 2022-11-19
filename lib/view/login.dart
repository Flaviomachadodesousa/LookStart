import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: <Widget>[
        Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF6408CC),
                    Color(0xFF724B9F),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          decoration: const InputDecoration(
                            icon: Padding(
                              padding: EdgeInsets.only(top: 10.0, left: 10.0),
                              child: Icon(Icons.email),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                          onSaved: (val) => email.text = val,
                          obscureText: false,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0)),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        style: const TextStyle(color: Colors.black),
                        controller: password,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.black),
                          icon: Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Icon(Icons.password),
                          ),
                        ),
                        onSaved: (val) => password.text = val,
                        obscureText: true,
                      ),
                    ),
                  ),
                  Center(
                      child: GestureDetector(
                          onTap: () {
                            print("Container clicked");
                          },
                          child: Container(
                            width: media.width / 1.5,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: Colors.white),
                            padding: const EdgeInsets.all(15),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Login",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ]),
                          )))
                ])),
      ]),
    );
  }
}
