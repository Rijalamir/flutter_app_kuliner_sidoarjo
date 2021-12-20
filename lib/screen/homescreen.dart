import 'dart:convert';
import 'package:flutter_app_kuliner_sidoarjo/entities/namakuliner.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_kuliner_sidoarjo/api/api_namakuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/api/api_kategori.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/listNamakuliner.dart';
import 'package:flutter_app_kuliner_sidoarjo/widget/kategoriKuliner.dart';
//import 'package:flutter_app_kuliner_sidoarjo/screen/namatempatscreen.dart';

class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  bool isSearching = false;
  List filteredkuliner = [];
  List listkategori = [];

  List listnamakuliner = [];

  List<Namakuliner> _namakuliners = <Namakuliner>[];
  List<Namakuliner> _namakulinersForDisplay = <Namakuliner>[];

  Future<List<Namakuliner>> fetchNamakuliners() async {
    var url = 'http://127.0.0.1:8000/api/nama_kuliner';
    var response = await http.get(url);

    var Namakuliners = <Namakuliner>[];

    if (response.statusCode == 200) {
      var NamakulinersJson = json.decode(response.body);
      for (var NamakulinerJson in NamakulinersJson) {
        Namakuliners.add(Namakuliner.fromJson(NamakulinerJson));
      }
    }
    return Namakuliners;
  }


  @override
  void initState() {
    fetchNamakuliners().then((data) {
      setState(() {
        _namakuliners.addAll(data);
        _namakulinersForDisplay = _namakuliners;

      });
    });
    getKategori().then((data) {
      setState(() {
        listkategori = data;
        //listnamakuliner = filteredkuliner = data;
      });
    });
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Kuliner Sidoarjo"),
          backgroundColor: Colors.green,

        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    //icon: Icon(Icons.search, color: Colors.white),
                    border: InputBorder.none,
                    hintText: ' Cari Kuliner',

                  ),
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      filteredkuliner = listnamakuliner.where((namakuliner) {
                        var namakulinerTitle = namakuliner.title.toLowerCase();
                        return namakulinerTitle.contains(text);
                      })
                          .toList();
                    });
                  },
                ),
                Container(
                  child: FutureBuilder<List>(
                    future: getNamakuliner(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData ? new ListNamakuliner(
                          listnamakuliner: snapshot.data
                      ) : new Center(
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
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]['nama']),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  kategoriKuliner(
                                      listkategori[index]
                                  ),
                            ));
                      },
                    );
                  },
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),


        // body: _children[_currentIndex],

      ),
    );
  }

}
