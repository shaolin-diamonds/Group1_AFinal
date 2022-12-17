// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'spyroFolder/spyro.dart';
import 'myListFolder/myList.dart';

class deleteFigureClass extends StatefulWidget {
  final String figureID, figurename;

  final SkylandsAPI api = SkylandsAPI();

  deleteFigureClass(this.figureID, this.figurename);

  @override
  _deleteFigureState createState() => _deleteFigureState(figureID, figurename);
}

class _deleteFigureState extends State<deleteFigureClass> {
  final String figureID, figurename;

  _deleteFigureState(this.figureID, this.figurename);

  void deleteMyListByFigureID(figureID) {
    setState(() {
      widget.api.deleteMyListByFigureID(figureID);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyListSkylanders(figureFranchise: "My List")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.figurename,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text(
                    'Would you like to delete "${widget.figurename}" ?',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  deleteMyListByFigureID(widget.figureID),
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyListSkylanders(
                                                  figureFranchise: "My List")),
                                    );
                                  })
                                },
                            child: Text("DELETE")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (() => setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyListSkylanders(
                                            figureFranchise: "My List")),
                                  );
                                })),
                            child: Text("NO")),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/BadJuju.png', height: 200, width: 200)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
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
