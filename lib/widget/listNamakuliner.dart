
import 'package:flutter/material.dart';
import 'package:flutter_app_kuliner_sidoarjo/api/api_namakuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/detailKuliner.dart';


class ListNamakuliner extends StatefulWidget {

  List listnamakuliner;

  ListNamakuliner ({this.listnamakuliner});

  @override
  State<ListNamakuliner> createState() => _ListNamakulinerState();
}

class _ListNamakulinerState extends State<ListNamakuliner> {
  bool isSearching = false;

  List filteredkuliner = [];
  List listnamakuliner = [];

  @override
  void initState() {
    getNamakuliner().then((data){
      setState(() {
        //listkategori = data;
        listnamakuliner = filteredkuliner = data;
      });
    });
    super.initState();
  }

  void _filterKuliner(value){
    setState(() {
      filteredkuliner = listnamakuliner
          .where((nama__kuliners) =>
          nama__kuliners['nama'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.listnamakuliner == null ? 0: widget.listnamakuliner.length,
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => DetailKuliner(
                  listnamakuliner:widget.listnamakuliner,index:index,
                ),
              ));
            },
            child:
              Container(
                padding: const EdgeInsets.all(8.0),
                child: new Card(
                  child: new ListTile(
                    leading: Image.network(widget.listnamakuliner[index]['gambar'],
                      width: 100, fit: BoxFit.cover ,),
                    title: new Text(widget.listnamakuliner[index]['nama'], style:
                    new TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),),
                    subtitle: Text("Kategori Kuliner : ${widget.listnamakuliner[index]['kategori__kuliners_nama']} | "
                        "Tempat Kuliner : ${widget.listnamakuliner[index]['nama_tempat__kuliners_nama']} | "
                        "Kisaran Harga : ${widget.listnamakuliner[index] ['harga']} |"),

                  ),
                ),
              ),


          );

        }
    );

  void _listItem(index) {

  }
  }
}
