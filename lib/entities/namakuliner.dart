import 'dart:html';

class Namakuliner {
  List<Data> data;

  Namakuliner({this.data});

  Namakuliner.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String nama;
  String kategoriKulinersNama;
  String namaTempatKulinersNama;
  String deskripsi;
  String gambar;
  String harga;

  Data(
      {this.id,
        this.nama,
        this.kategoriKulinersNama,
        this.namaTempatKulinersNama,
        this.deskripsi,
        this.gambar,
        this.harga});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    kategoriKulinersNama = json['kategori__kuliners_nama'];
    namaTempatKulinersNama = json['nama_tempat__kuliners_nama'];
    deskripsi = json['deskripsi'];
    gambar = json['gambar'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['kategori__kuliners_nama'] = this.kategoriKulinersNama;
    data['nama_tempat__kuliners_nama'] = this.namaTempatKulinersNama;
    data['deskripsi'] = this.deskripsi;
    data['gambar'] = this.gambar;
    data['harga'] = this.harga;
    return data;
  }
}
