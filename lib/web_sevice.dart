import 'dart:convert';
import 'model.dart';
import 'package:http/http.dart' as http;
class WebService{
 static Future<Model>album(http.Client client)async{
    final response= await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if(response.statusCode==200){
      return Model.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load album');
    }
  }
}