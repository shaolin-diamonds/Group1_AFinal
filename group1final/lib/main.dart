import 'package:flutter/material.dart';
import 'myListFolder/myList.dart';
import 'spyroFolder/spyro.dart';
import 'giantsFolder/giants.dart';
import 'api.dart';

/*
  Authors:
    Anthony Huisenga-Wills​
    Dylan Feddersen​
    Chevy Rios​
    Gustavo Marin Borges
  Date: 12/10/2022
  Title: Group Final
  Class: CMSC 2204 – Mobile Device Programming
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skylanders Collection Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final SkylandsAPI api = SkylandsAPI();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List programs = [];

  bool _dbLoaded = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skylanders Collection Tracker",
            style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'My List',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: Text("See Collection",
                      style: TextStyle(fontSize: 21, color: Colors.white)),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black, fixedSize: Size(200, 50)),
                  onPressed: (() => setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyListSkylanders(figureFranchise: "My List")),
                        );
                      }))),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Spyro's Adventure (2011)",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: Text("See List",
                      style: TextStyle(fontSize: 21, color: Colors.white)),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.purple, fixedSize: Size(200, 50)),
                  onPressed: (() => setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SpyroSkylanders(
                                  figureFranchise: "Spyro's Adventure (2011)")),
                        );
                      }))),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Giants (2012)',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  child: Text(
                    "See List",
                    style: TextStyle(fontSize: 21, color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      fixedSize: Size(200, 50)),
                  onPressed: (() => setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GiantsSkylanders(
                                  figureFranchise: "Giants (2012)")),
                        );
                      }))),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '\n\nThis App will help the user to keep track of their Skylanders collection. In order to not get the same one twice.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.deepOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
