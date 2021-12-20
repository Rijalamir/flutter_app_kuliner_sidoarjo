

import 'package:dio/dio.dart';

Future<List> getNamakuliner() async{
  var dio = Dio();
  Response response = await dio.get("http://127.0.0.1:8000/api/nama_kuliner");
  return response.data['data'];


}