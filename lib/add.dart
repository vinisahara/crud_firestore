import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_firestore/main.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _shortdescController = TextEditingController();
  TextEditingController _descall = TextEditingController();
  TextEditingController _image = TextEditingController();
  CollectionReference _newsCollection =
      FirebaseFirestore.instance.collection('news');

  Future<void> add([DocumentSnapshot? documentSnapshot]) async {
    final String? vartitle = _titleController.text;
    final String? varshortdesc = _shortdescController.text;
    final String? vardesc = _descall.text;
    final String? varimage = _image.text;

    await _newsCollection.add({
      "title": vartitle,
      "short_desc": varshortdesc,
      "desc": vardesc,
      "img": varimage
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[100],
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title: new Text("Tambahkan Data Laptop"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: _shortdescController,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(labelText: 'Short Desc'),
                  ),
                  TextField(
                    controller: _descall,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(labelText: 'Desc'),
                  ),
                  TextField(
                    controller: _image,
                    minLines: 1,
                    maxLines: 2,
                    decoration: InputDecoration(labelText: 'Image Url'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      child: new Text("Tambahkan"),
                      textColor: Colors.white,
                      color: Colors.blue[900],
                      onPressed: () => add()),
                ],
              ),
            ),
          )),
    );
  }
}
