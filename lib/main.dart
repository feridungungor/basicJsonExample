import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ezanvakitleri/model/city_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Future<List<AllCity>> _getCity() async {
    var response = await http.get('https://ezanvakti.herokuapp.com/ulkeler');
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List).map((tekgonderimap)=>AllCity.fromJson(tekgonderimap)).toList();
    } else {
      throw Exception("Önemli değil ama bağlanamadık : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ulkeler"),
        ),
        body: FutureBuilder(
          future: _getCity(),
          builder: (BuildContext context,AsyncSnapshot<List<AllCity>>snapshot){
            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,index){
                return ListTile(
                  title: Text(snapshot.data[index].ulkeAdi),
                );
              });
            }
            else {return Center(child: CircularProgressIndicator(),);}
          },
        ),
      ),
    );
  }
}
