import 'dart:convert';


import 'package:http/http.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';

import 'Api client.dart';




class EcommeurseApi {
  ApiClient apiClient = ApiClient();


  Future<EcommeurseModelclass> getEcommeurse() async {
    String trendingpath = 'http://45.159.221.50:9890/api/signup';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return EcommeurseModelclass .fromJson(jsonDecode(response.body));
  }
}