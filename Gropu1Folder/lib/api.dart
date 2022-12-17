import "package:dio/dio.dart";

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

const String localhost = "http://10.0.2.2:1200/";

class SkylandsAPI {
  final _dio = Dio(BaseOptions(baseUrl: localhost));

  Future<List> getMyList() async {
    final response = await _dio.get('/getMyList');

    return response.data['toys'];
  }

  Future<List> getAllAdventures() async {
    final response = await _dio.get('/getAllAdventures');

    return response.data['toys'];
  }

  Future<List> getAllGiants() async {
    final response = await _dio.get('/getAllGiants');

    return response.data['toys'];
  }

  Future findAdventures(String figureName) async {
    final response =
        await _dio.post('/findAdventures', data: {"figureName": figureName});

    return response.data['toys'];
  }

  Future addOwned(String figureFranchise, String figureYear, String figureID,
      String figureName) async {
    await _dio.post('/addOwned', data: {
      "figureFranchise": figureFranchise,
      "figureYear": figureYear,
      "figureID": figureID,
      "figureName": figureName,
    });
  }

  Future deleteMyListByFigureID(String figureID) async {
    await _dio.post('/deleteMyListByFigureID', data: {"figureID": figureID});
  }

  Future editOwned(String figureName) async {
    await _dio.post('/editOwned', data: {"figureName": figureName});
  }
}
