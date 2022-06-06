import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data =>
      _data;

  int get jumlahData => _data.length;

  void connectAPI(
      {String nim = "",
      String nama = "",
      String jk = "",
      String alamat = "",
      String jurusan = "",
      String request = "get"}) async {
    Uri url = Uri.parse(
        "http://localhost/restapi/");

    dynamic response;
    if (request == "get") {
      response = await http.get(url);
      _data = json.decode(response.body);
    } else {
      response = await http.post(
        url,
        body: {
          "nim": nim,
          "nama": nama,
          "jk": jk,
          "alamat": alamat,
          "jurusan": jurusan,
        },
      );

      _data = json.decode(response.body)[
          "data"];
    }
    notifyListeners();
  }
}