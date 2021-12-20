
import 'package:flutter/material.dart';
import 'package:flutter_app_kuliner_sidoarjo/api/api_namakuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/api/api_kategori.dart';
import 'package:flutter_app_kuliner_sidoarjo/api/api_namatempat.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/kategoriKuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/listTempatkuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/screen/namatempatscreen.dart';
import 'package:flutter_app_kuliner_sidoarjo/screen/homescreen.dart';


class namatempatscreen extends StatefulWidget {
  //const namatempatscreen({Key? key}) : super(key: key);

  @override
  _namatempatscreenState createState() => _namatempatscreenState();
}

class _namatempatscreenState extends State<namatempatscreen> {

  List listkategori = [];

  @override
  void initState() {
    getKategori().then((data){
      setState(() {
        listkategori = data;
      });
    });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        appBar: AppBar(title: Text("Kuliner Sidoarjo"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: FutureBuilder<List>(
                    future: getNamatempat(),
                    builder: (context, snapshot){
                      if(snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData ? new ListTempatkuliner(
                          listtempatkuliner:snapshot.data
                      ): new Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),

              ],
            )

        ),
        drawer: new Drawer(
          child: FutureBuilder<List>(
            future: getKategori(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(snapshot.data[index]['nama']),
                      onTap: (){
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => kategoriKuliner(
                                  listkategori[index]
                              ),
                            ));
                      },
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),


        // body: _children[_currentIndex],

      ),
    );
  }
}
