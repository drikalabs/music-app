import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_library_app/service/artist_service.dart';
import 'package:music_library_app/view/music.dart';
class ArtistView extends StatefulWidget{
  static final String routeName = 'artist';
  ArtistService artistService;
  String idGenre;

  ArtistView({this.artistService,this.idGenre});

  @override
  State createState() {
    return _ArtistViewState(artistService,idGenre);
  }
}

class _ArtistViewState extends State{
  ArtistService _artistService;
  List artistDataList = List();
  String genreId;
  _ArtistViewState(this._artistService,this.genreId);

 getData()async{
   var response =await _artistService.getArtistByGenre(genreId);
   setState(() {
     artistDataList = jsonDecode(response.body) as List;
   });
 }
 @override
  void initState() {
    // TODO: implement initState
   getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   print(genreId);
   print(artistDataList);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Center(
          child: Text("Welcome to D'Music"),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.3, 0.7, 0.9],
            colors: [
              Colors.grey[700],
              Colors.grey[900],
              Colors.grey[900],
              Colors.grey[900],
            ],
          ),
        ),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children:List.generate(artistDataList.length, (index){
            return GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, MusicComponent.routeName, arguments: artistDataList[index]['idArtist']);
              },
              child: Center(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Image.network('http://10.0.2.2:80/img/'+artistDataList[index]['idArtist']+'.jpg',fit:BoxFit.fill,width: 185,height: 140,),
                      ),
                      Positioned(
                        top: 99.0,
                        left: 10.0,
                        right: 10.0,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                               Text(
                                  artistDataList[index]['artistName'],
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ) ,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}