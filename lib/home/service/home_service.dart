import 'package:e_commerce_app/home/models/home_response.dart';
import 'package:e_commerce_app/resources/constants.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'dart:convert';
import 'package:get/get.dart';

class HomeService {
  static Future<List<Product>> getHomeData() async {
    Response response = await ApiService().getData(AppConstants.productsEndPoint);
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.bodyString??"");
      return data.map((item) => Product.fromJson(item)).toList();
    } else {
      debugPrint('API Call Failed: ${response.statusText}');
      return [];
    }
  }
}



