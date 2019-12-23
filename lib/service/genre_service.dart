import 'package:http/http.dart' as http;

class GenreService {

  getAllgenrelist() async{
    var response = await http.get('http://10.0.2.2:9009/genres');
    return response;
  }
}
