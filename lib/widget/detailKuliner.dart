
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/showRatingDialog.dart';

class DetailKuliner extends StatelessWidget {

  List listnamakuliner;
  int index;

  //var context;

  DetailKuliner({this.listnamakuliner, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${listnamakuliner[index]['nama']}'),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          new Image.network('${listnamakuliner[index]['gambar']}'),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Text('${listnamakuliner[index]['nama']}', style:
            new TextStyle(fontWeight: FontWeight.bold),),
          ),
          new Container(
            padding: const EdgeInsets.all(16.0),
            child: new Text(
              "Harga Rp. : '${listnamakuliner[index]['harga']}'" " | "
                  "Kategori : " '${listnamakuliner[index]['kategori__kuliners_nama']}' " | "
                  "Tempat Makan : "'${listnamakuliner[index]['nama_tempat__kuliners_nama']}',
              style:
              new TextStyle(fontWeight: FontWeight.bold),),
          ),


          new Container(
            padding: const EdgeInsets.all(26.0),
            child: Html(
              data: "Deskripsi : " '${listnamakuliner[index]['deskripsi']}',
            ),
          ),

          new Container(
            child: TextButton.icon(
                icon: Icon(Icons.star, color: Colors.amber),
                label: Text( 'Tinggalkan Rating dan Komentar', style: TextStyle(color: Colors.white, fontSize: 15) ),
                style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 5,

                shape: const BeveledRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: EdgeInsets.all(12)
            ),
              onPressed: (){
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => ShowRatingDialog(),
                ));
              },
          ),
          )

          ],
      ),


    );
  }



}