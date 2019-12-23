import 'dart:convert';

import 'package:http/http.dart' as http;

class ArtistService {

  List<dynamic> artist = List();
  List allArtist;
  var dataArtistById;
  getAllgenrelist() async{
    var response = await http.get('http://10.0.2.2:9009/artists');
    allArtist = json.decode(response.body) as List;
  }
  getArtistByGenre(String idGenre) async{
    var response = await http.get('http://10.0.2.2:9009/artist/genre/$idGenre');
    return response;
  }
  getArtistById(idArtist) async{
    var response = await http.get('http://10.0.2.2:9009/artist/genre/$idArtist');
     dataArtistById =json.decode(response.body);
  }
  getDataArtistById(){
    return dataArtistById;
  }
}
