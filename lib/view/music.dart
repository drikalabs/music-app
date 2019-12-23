import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:music_library_app/service/song_service.dart';

class MusicComponent extends StatefulWidget {
  SongService _songService;
  String _idService;
  static final String routeName = 'musicArtist';
  MusicComponent(this._songService, this._idService);

  @override
  State createState() {
    return _MusicComponentState(_songService,_idService);
  }
}

class _MusicComponentState extends State {
  SongService _songService;
  String _idArtist;
  List musics = List();

  _MusicComponentState(this._songService,this._idArtist);

  fetchBegin() async{
    var response = await _songService.getSongByArtist(_idArtist);
    setState(() {
      musics = json.decode(response.body) as List;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
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
                itemCount:musics.length ,
                itemBuilder: (context, index) {
                  return Container(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.1, 0.5, 0.7, 0.9],
                          colors: [
                            Colors.grey[900],
                            Colors.grey[900],
                            Colors.grey[800],
                            Colors.grey[800],
                          ],
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Image.asset('img/musicon.png',height: 100,width: 100,fit: BoxFit.fill,),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(musics[index]['titleSong'],style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20
                                ),),
                                Text(musics[index]['songDuration'],style: TextStyle(
                                    color: Colors.white,
                                ),)
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
