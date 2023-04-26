import 'dart:convert';
import 'package:http/http.dart' as http;

import '../globals/globals.dart';

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Map?> getPics(String category) async {
    String url = "https://pixabay.com/api/?key=${Globals.apiKey}&q=$category+flowers&image_type=photo&pretty=true";
    http.Response res = await http.get(
      Uri.parse(url),
    );
    if(res.statusCode == 200){
      Map data = jsonDecode(res.body);
      return data;
    }
    return null;
  }
}
