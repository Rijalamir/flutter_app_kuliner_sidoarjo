

import 'package:dio/dio.dart';

Future<List> getKategori() async{
  var dio = Dio();
  Response response = await dio.get("http://127.0.0.1:8000/api/kategori_kuliner");
  return response.data['data'];
}