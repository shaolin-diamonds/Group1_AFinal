import 'package:flutter/material.dart';
import 'api.dart';
import 'main.dart';
import 'spyroFolder/spyro.dart';
import 'myListFolder/myList.dart';

class addFigureClass extends StatefulWidget {
  final String _id, figureFranchise, figureYear, figureID, figureName;

  final SkylandsAPI api = SkylandsAPI();

  addFigureClass(this._id, this.figureFranchise, this.figureYear, this.figureID,
      this.figureName);

  @override
  _addFigureState createState() =>
      _addFigureState(_id, figureFranchise, figureYear, figureID, figureName);
}

class _addFigureState extends State<addFigureClass> {
  final String _id, figureFranchise, figureYear, figureID, figureName;

  _addFigureState(this._id, this.figureFranchise, this.figureYear,
      this.figureID, this.figureName);

  void addOwned(_id, figureFranchise, figureYear, figureID, figureName) {
    setState(() {
      widget.api
          .addOwned(_id, figureFranchise, figureYear, figureID, figureName);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SpyroSkylanders(figureFranchise: "Spyro's Adventure (2011)")),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.figureName,
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
                    'Would you like to add "${widget.figureName}" ?',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {
                                  addOwned(
                                      widget._id,
                                      widget.figureFranchise,
                                      widget.figureYear,
                                      widget.figureID,
                                      widget.figureName),
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SpyroSkylanders(
                                              figureFranchise:
                                                  "Spyro's Adventure (2011)")),
                                    );
                                  })
                                },
                            child: Text("Yes")),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: (() => setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SpyroSkylanders(
                                            figureFranchise:
                                                "Spyro's Adventure (2011)")),
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
