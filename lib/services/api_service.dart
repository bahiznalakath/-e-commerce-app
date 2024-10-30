import 'package:e_commerce_app/helper/connectivity_status.dart';
import 'package:e_commerce_app/resources/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ApiService extends GetConnect {
  final String noNetwork = "No network connection";
  final String exceptionMessage = "An error occurred";

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Future<Response> getData(String uri) async {
    debugPrint(' begin====> API Call: 1  getData(String $uri) ');
    bool connected = await connectivityStatus();
    if (connected == false ) {
      debugPrint(' begin====> API Call: 1  connectedg $connected  or $noNetwork) ');
      return Response(statusCode: 0, statusText: noNetwork);
    } else {
      debugPrint(' begin====> API Call: 1  else trying ) ');

      try {
        Response response = await get('${AppConstants.baseUrl}$uri',);
        debugPrint('====> API Call: $uri\nResponse: ${response.body}');
        print('====> API Call: $uri\nResponse: ${response.body}');
        return response;
      } catch (e) {
        debugPrint('====> API Call: $uri\nResponse: ${e}');
        print('====> API Call: $uri\nResponse: ${e}');
        return Response(statusCode: 1, statusText: exceptionMessage);
      }
    }
  }

}
