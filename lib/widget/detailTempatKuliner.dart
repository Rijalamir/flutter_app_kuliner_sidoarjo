
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/showRatingDialog.dart';

class DetailTempatKuliner extends StatelessWidget {

  List listtempatkuliner;
  int index;

  //var context;

  DetailTempatKuliner({this.listtempatkuliner, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${listtempatkuliner[index]['nama']}'),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Text('${listtempatkuliner[index]['nama']}', style:
            new TextStyle(fontWeight: FontWeight.bold),),
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Text(
              "Alamat : '${listtempatkuliner[index]['alamat']}'" " | "
                  "No. Telpon : " '${listtempatkuliner[index]['no_telp']}' " | "
                  ,
              style:
              new TextStyle(),),
          ),






        ],
      ),


    );
  }



}