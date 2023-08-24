import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Api{

Future<dynamic> get({required String url, @required String? tkn })async{

  Map<String, String> headers = {};
  if (tkn != null){
    headers.addAll({'Authorization': 'Bearer $tkn'});
  }

  http.Response response = await http.get(Uri.parse(url),headers: headers);

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }
  else{
    throw Exception('there was a problem in status code ${response.statusCode}');

  }

}


Future<dynamic> post({required String url,@required dynamic body,@required String? tkn})async{

  Map<String, String> headers = {};
  if (tkn != null){
    headers.addAll({'Authorization': 'Bearer $tkn'});
  }

  http.Response response = await http
      .post(Uri.parse(url),
      body: body,
    headers: headers
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
  else{
    throw Exception('there was a problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}');
  }
}


Future<dynamic> put({required String url,@required dynamic body,@required String? tkn})async{

  Map<String, String> headers = {};
  headers.addAll({
    'Content-Type': 'application/x-www-form-urlencoded'
  });
  if (tkn != null){
    headers.addAll({'Authorization': 'Bearer $tkn'});
  }
  print('url = $url body = $body token = $tkn');
  http.Response response = await http
      .put(Uri.parse(url),
      body: body,
      headers: headers
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    return data;
  }
  else{
    throw Exception('there was a problem in status code ${response.statusCode} with body ${jsonDecode(response.body)}');
  }
}

}