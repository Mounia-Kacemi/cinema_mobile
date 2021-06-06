import 'package:cinema_mobile_app/app-util.dart';
import 'package:cinema_mobile_app/cinemas-page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VillePage extends StatefulWidget {
  @override
  _VillePageState createState() => _VillePageState();
}

class _VillePageState extends State<VillePage> {
  List<dynamic> listVilles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Villes"),
      ),
      body: Center(
          child: this.listVilles == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount:
                      (this.listVilles == null) ? 0 : this.listVilles.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          color: Colors.white,
                          child: Text(
                            this.listVilles[index]['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new CinemasPage(
                                        this.listVilles[index])));
                          },
                        ),
                      ),
                    );
                  })),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.purple,
          onPressed: () {}),
    );
  }

  @override
  void initState() {
    super.initState();
    loadVilles();
  }

  void loadVilles() {
    //String url = "http://105.66.3.99:8080/villes";
    String url = (GlobalData.host + "/villes");
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.listVilles = json.decode(resp.body)['_embedded']['villes'];
      });
    }).catchError((err) {
      print(err);
    });
  }
}
