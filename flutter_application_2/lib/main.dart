import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';

void main() {
  runApp(BelajarGetData());
}

class BelajarGetData extends StatefulWidget {
  @override
  State<BelajarGetData> createState() => _BelajarGetDataState();
}

class _BelajarGetDataState extends State<BelajarGetData> {
  // final Uri apiUrl = Uri.parse("https://reqres.in/api/users?per_page=15");
  StreamController<dynamic> _controllerData = StreamController();

  Map<String, dynamic>? statusLoading;

  void handleGetData() async {
    var dio = Dio();
    var response = await dio.request(
      'https://devsitaracore.tapera.go.id/pmf/peserta-kuota/api/v1/peserta',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.data['code'] == 200) {
      log(response.data['code']);
      _controllerData.sink.add(response.data['data']);
    } else {
      _controllerData.sink.add('gak ada data');
      setState(() {
        statusLoading = {
          "code": response.data['code'],
          "message": response.data['message']
        };
      });
      print(response.statusMessage);
    }
  }

  @override
  initState() {
    super.initState();
    handleGetData();
  }

  String text1 = "Belajar ";
  String text2 = "Fetching Data";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 175, 100, 188),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              rumah(nama: text1),
            ],
          ),
        ),
        body: Container(
          // margin: EdgeInsets.all(),
          child: StreamBuilder<dynamic>(
            stream: _controllerData.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.stars),
                          ),
                          title: Text(
                              'ini kena ${snapshot.data[index]['nama_lengkap'].toString()}'),
                        ),
                      );
                    });
              } else {
                return Center(child: Text('lagi loading'));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget rumah({nama = 'rumah kosong', alamat = ' ini dah'}) {
    return Text(nama + alamat);
  }
}
