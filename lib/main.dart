import 'package:cinema_mobile_app/menuItem.dart';
import 'package:cinema_mobile_app/setting-page.dart';
import 'package:cinema_mobile_app/villes-page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.purpleAccent),
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // List<dynamic> listVilles;

  final menus = [
    {'title': 'Home', 'icon': Icon(Icons.home), 'page': VillePage()},
    {'title': 'Setting', 'icon': Icon(Icons.settings), 'page': SettingPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema Page "),
      ),
      body: Center(
        child: Text("Home cinema"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./Pictures/pic.jpg"),
                  radius: 40.0,
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.white, Colors.purple])),
            ),
            Divider(
              color: Colors.purple,
            ),
            ...this.menus.map((item) {
              return Column(
                children: <Widget>[
                  Divider(color: Colors.purple),
                  MenuItem(item['title'], item['icon'], (context) {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => item['page']));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
