import 'package:http/http.dart' as http;

class SongService {

  getSongByArtist(idArtist) async{
    var response = await http.get('http://10.0.2.2:9009/songs/artist/$idArtist');
    return response;
  }
}
