
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/detailKuliner.dart';

class kategoriKuliner extends StatelessWidget {


  final Map kategori;
  kategoriKuliner(this.kategori);

  Future<List> getKategoriKuliner() async{
    final id = kategori['id'];
    var response = await Dio().get('http://127.0.0.1:8000/api/nama_kuliner/kategori_kuliner/${id}');
    return response.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(kategori['nama']),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List>(
        future: getKategoriKuliner(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: new Card(
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailKuliner(
                                listnamakuliner: snapshot.data, index: index,
                              ))
                          );
                        },
                        child: new ListTile(
                          leading: Image.network("${snapshot.data[index]['gambar']}", width: 100, fit: BoxFit.cover,),
                          title: new Text("${snapshot.data[index]['nama']}",
                            style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black87) ,),
                          subtitle: new Text("Tempat Kuliner : ${snapshot.data[index]['nama_tempat__kuliners_nama']} | " "Kisaran Harga : ${snapshot.data[index] ['harga']} | "),
                        ),
                      ),
                    ),
                  );

                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
