import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_library_app/service/genre_service.dart';
import 'package:music_library_app/view/artists_view.dart';

class IndexComponent extends StatefulWidget {
  GenreService _genreService;
  static final String routeName = 'index';
  IndexComponent(this._genreService);

  @override
  State createState() {
    return _IndexComponentState(_genreService,);
  }
}

class _IndexComponentState extends State {
  GenreService _genreService;

  List genrelist = new List();
  _IndexComponentState(this._genreService);
  fetchBegin() async {
    var response = await _genreService.getAllgenrelist();
    setState(() {
      genrelist = json.decode(response.body) as List;
    });
  }
  @override
  void initState() {
    fetchBegin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Center(
          child: Text("Welcome to D'Music"),
        ),
      ),
      body: Container(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.grey[700],
                  Colors.grey[900],
                  Colors.grey[900],
                  Colors.grey[900],
                ],
              ),
            ),
            child: ListView.builder(
                itemCount: genrelist.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      height: 160,
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(25),
                      child: RaisedButton(
                        color: Colors.grey[700],
                        onPressed: () {
                          Navigator.pushNamed(context, ArtistView.routeName, arguments: genrelist[index]['idGenre']);
                        },
                        child: Container(
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(3),
                                  margin: EdgeInsets.all(10),
                                  child: Image.asset(
                                    genrelist[index]['labelGenre'] == 'ROCK' ? 'img/rock.png' :
                                    genrelist[index]['labelGenre'] == 'HIP HOP' ? 'img/hiphop.png' :
                                    genrelist[index]['labelGenre'] == 'ELECTRONIC' ? 'img/electronic.png' :
                                    genrelist[index]['labelGenre'] == 'POP' ? 'img/pop.png' :
                                    genrelist[index]['labelGenre'] == 'COUNTRY' ? 'img/country.png' :
                                    'img/jazz.png',
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  genrelist[index]['labelGenre'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
        color: Colors.white10,
      ),
    );
  }
}
