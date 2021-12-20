
import 'package:flutter/material.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/detailTempatKuliner.dart';


class ListTempatkuliner extends StatelessWidget {

  final List listtempatkuliner;
  ListTempatkuliner ({this.listtempatkuliner});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: listtempatkuliner == null ? 0: listtempatkuliner.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => DetailTempatKuliner(
                  listtempatkuliner:listtempatkuliner,index:index,
                ),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: new Card(
                child: new ListTile(
                  title: new Text(listtempatkuliner[index]['nama'], style:
                  new TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
                  subtitle: Text("Alamat : ${listtempatkuliner[index]['alamat']} | "
                      "No. Telp : ${listtempatkuliner[index]['no_telp']} | "),

                ),
              ),
            ),
          );

        }
    );
  }
}
