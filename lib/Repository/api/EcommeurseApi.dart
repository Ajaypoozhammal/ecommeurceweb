import 'dart:convert';


import 'package:http/http.dart';
import 'package:untitled4/Repository/model%20class/BannerModelClass.dart';
import 'package:untitled4/Repository/model%20class/EcommeurseModelclass.dart';
import 'package:untitled4/Repository/model%20class/SigninmodelClass.dart';

import '../model class/PopularProductModel.dart';
import 'Api client.dart';




class EcommeurseApi {
  ApiClient apiClient = ApiClient();


  Future<EcommeurseModelclass> getSignup(String fullName,
      String email,
      String password) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/signup';
    print(trendingpath);
    var body = {


        "fullName": fullName,
        "email": email,
        "password": password

    };
    print('hello' + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body));

    print(response.body);
    return EcommeurseModelclass.fromJson(jsonDecode(response.body));
  }

  Future<SigninmodelClass> getSignin(
      String email,
      String password) async {
    String trendingpath =
        'http://45.159.221.50:9890/api/signin';
    print(trendingpath);
    var body = {


        "email":email,
        "password":password

    };
    // print('hello' + body.toString());
    Response response =
    await apiClient.invokeAPI(trendingpath, 'POST', jsonEncode(body),);

    print(response.body);
    return SigninmodelClass.fromJson(jsonDecode(response.body));
  }

  Future<List<BannerModelClass>> getBanner() async {
    String trendingpath = 'http://45.159.221.50:9890/api/banner';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);

    return BannerModelClass.listFromJson(jsonDecode(response.body));
  }
  Future<List<PopularProductModel>>getPopularProduct() async {
    String trendingpath = 'http://45.159.221.50:9890/api/popular-products';
    var body = {

    };
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);
    return PopularProductModel.listFromJson(jsonDecode(response.body));

  }
}