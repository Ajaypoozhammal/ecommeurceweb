import 'dart:convert';


import 'package:http/http.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';

import 'Api client.dart';




class EcommeurseApi {
  ApiClient apiClient = ApiClient();


  Future<EcommeurseModelclass> getEcommeurse(String fullName,
      String email,
      String password) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/signup';
    print(trendingpath);
    var body = {
      {

        "fullName": fullName,
        "email": email,
        "password": password
      }
    };
    // print('hello' + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),);

    print(response.body);
    return EcommeurseModelclass.fromJson(jsonDecode(response.body));
  }

}