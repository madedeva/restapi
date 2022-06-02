import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {}; //wadah data

  Map<String, dynamic> get data =>
      _data; //getter => untuk mengakses data ini yang akan diakses dari kelas luar

  int get jumlahData => _data.length; //menyimpan jumlah data

  void connectAPI(
      {String nama = "",
      String alamat = "",
      String nim = "",
      String jk = "",
      String jurusan = "",
      String request = "get"}) async {
    Uri url = Uri.parse(
        "http://10.10.42.110/restapi/"); //untuk nyimpan URL dr API

    dynamic hasilResponse;
    if (request == "get") {
      hasilResponse = await http.get(url);
      _data = json.decode(hasilResponse.body);
    } else {
      hasilResponse = await http.post(
        //buat wadah + simpan data yang ingin dikirimkan
        url, //diisii oleh url yang dibuat
        body: {
          "nama": nama,
          "alamat": alamat,
          "nim": nim,
          "jk": jk,
          "jurusan": jurusan,
        },
      );

      // print(json.decode(hasilResponse.body)[
      //     "data"]);
      _data = json.decode(hasilResponse.body)[
          "data"]; //untuk menerjemahkan kode-kode yang dihasilkan dr data yang dikirimkan
    }
    notifyListeners(); //untuk ngebaca jika ada perubahan di datanya
  } //13-26 fungsi we -> konek ke API
}

//http.post -> untuk menampilkan database