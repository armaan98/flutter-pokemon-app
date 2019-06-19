import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static Future<dynamic> getRequest(String url) {
    try {
      return http.get(url).then((http.Response response) {
        final res = json.decode(response.body);
        final int statusCode = response.statusCode;
        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw ("Error while fetching data");
        }
        return res;
      });
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> postRequest(String url, {Map headers, body, encoding}) {
    return http
        .post(url, body: body, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return res;
    });
  }
}
