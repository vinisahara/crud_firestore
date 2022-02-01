import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/cupertino.dart';

class View extends StatefulWidget {
  // const View({ Key? key }) : super(key: key);
  List list;
  int index;
  View({required this.index, required this.list});

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue[100],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: new Text("Deksripsi Laptop"),
      ),
      body: new SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text(
                  "${widget.list[widget.index]['title']}",
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Image.network("${widget.list[widget.index]['img']}"),
                new Padding(padding: const EdgeInsets.only(top: 20.0)),
                new Text(
                  "${widget.list[widget.index]['desc']}",
                  style: new TextStyle(fontSize: 15.0),
                ),
                ElevatedButton(
                  onPressed: () => sweatAlert(context),
                  child: const Text("Beli"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void sweatAlert(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Anda Telah Memilih Laptop",
      desc:
          "Anda akan menerima email dari admin untuk menyelesaikan pembayaran",
      buttons: [
        DialogButton(
          child: Text(
            "Selanjutnya",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
        )
      ],
    ).show();
    return;
  }
}
