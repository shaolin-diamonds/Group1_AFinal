import 'package:flutter/material.dart';
import '../api.dart';
import '../main.dart';

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

class GiantsSkylanders extends StatefulWidget {
  final figureFranchise;
  GiantsSkylanders({super.key, required this.figureFranchise});

  final SkylandsAPI api = SkylandsAPI();

  @override
  State<GiantsSkylanders> createState() => _GiantsSkylandersState();
}

class _GiantsSkylandersState extends State<GiantsSkylanders> {
  List toys = [];
  bool _dbLoaded = false;

  void initState() {
    super.initState();

    widget.api.getAllGiants().then((data) {
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
                                        /*Navigator.pop(context),
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditOwnClass(
                                                        toy['figureFranchise']))),*/
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
                                        trailing: Text(
                                            (toy['figureID'].toString()),
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center),
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
