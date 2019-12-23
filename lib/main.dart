import 'package:flutter/material.dart';
import 'package:music_library_app/service/artist_service.dart';
import 'package:music_library_app/service/genre_service.dart';
import 'package:music_library_app/service/song_service.dart';
import 'package:music_library_app/view/artists_view.dart';
import 'package:music_library_app/view/index_component.dart';
import 'package:music_library_app/view/music.dart';

void main() {
    runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Music Pedia',
      initialRoute: IndexComponent.routeName,
      onGenerateRoute: (RouteSettings settings){
        ArtistService artistService = ArtistService();
        var routes =<String, WidgetBuilder>{
          IndexComponent.routeName : (context) => IndexComponent( GenreService() ),
          ArtistView.routeName :(context)=>ArtistView(artistService:artistService, idGenre:settings.arguments),
          MusicComponent.routeName:(context)=>MusicComponent(SongService(),settings.arguments),
        };
        WidgetBuilder route = routes[settings.name];
        return MaterialPageRoute(builder: (context)=>route(context));
      },
    )
  );
}
