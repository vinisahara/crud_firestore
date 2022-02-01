import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firestore/home_page.dart';
import 'package:crud_firestore/splashscreen_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String tag = 'login-page';
  static int statusLogin = 0;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  CollectionReference _newsCollection =
      FirebaseFirestore.instance.collection('admin');

  Future<void> login([DocumentSnapshot? documentSnapshot]) async {
    final String? varuser = _username.text;
    final String? varpwd = _password.text;
    var result = await _newsCollection
        .where("user", isEqualTo: varuser)
        .where("pwd", isEqualTo: varpwd)
        .get();
    if (result.docs.length == 1) {
      Login.statusLogin = 1;
      Navigator.of(context).pushReplacementNamed(HomePage.tag);
    } else {
      var snackBar = const SnackBar(
        content: Text('Email atau Password salah'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    Future(() {
      if (Login.statusLogin == 1) {
        Navigator.of(context).pushReplacementNamed(HomePage.tag);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(" Halaman Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              child: TextField(
                controller: _username,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    icon: Icon(Icons.mail),
                    hintText: 'Masukan Email Anda'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              child: TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    icon: Icon(Icons.lock),
                    hintText: 'Masukan password'),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(30.0)),
              child: MaterialButton(
                onPressed: () {
                  login();
                },
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                child: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
