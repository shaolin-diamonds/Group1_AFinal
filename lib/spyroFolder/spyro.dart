import 'package:flutter/material.dart';
import '../api.dart';
import '../main.dart';
import '../addOwned.dart';

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

class SpyroSkylanders extends StatefulWidget {
  final figureFranchise;
  SpyroSkylanders({super.key, required this.figureFranchise});

  final SkylandsAPI api = SkylandsAPI();

  @override
  State<SpyroSkylanders> createState() => _SpyroSkylandersState();
}

class _SpyroSkylandersState extends State<SpyroSkylanders> {
  List toys = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getAllAdventures().then((data) {
      setState(() {
        toys = data;
        _dbLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(widget.figureFranchise + "\n" + "Generation | Name | ID",
            style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
      ),
      body: Center(
          child: _dbLoaded
              ? Column(
                  children: [
                    Expanded(
                      child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.all(15.0),
                          children: [
                            ...toys
                                .map<Widget>(
                                  (toy) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: TextButton(
                                      onPressed: () => {
                                        Navigator.pop(context),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    addFigureClass(
                                                        toy['figureFranchise'],
                                                        toy['figureYear'],
                                                        toy['figureID'],
                                                        toy['figureName']))),
                                      },
                                      child: ListTile(
                                        leading: Text(
                                          toy['figureFranchise'],
                                          style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.blue,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        title: Text((toy['figureName']),
                                            style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                            ),
                                            textAlign: TextAlign.center),
                                        trailing: Image.asset(
                                            'assets/' +
                                                toy['figureID'] +
                                                '.png',
                                            height: 50,
                                            width: 50),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ]),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Database Loading",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    CircularProgressIndicator()
                  ],
                )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          onPressed: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage())),
              }),
    );
  }
}
