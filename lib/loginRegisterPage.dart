import 'package:flutter/material.dart';

class LoginRegisterPage extends StatefulWidget {
  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Login"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
          child: new Column(),
        ),
      ),
    );
  }

  List<Widget> createInputs() {
    return [];
  }

  Widget logo() {
    return new Hero(
      child: new CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 110.0,
        child: Image.asset('logo/Logo.png'),
      ),
    );
  }
}
