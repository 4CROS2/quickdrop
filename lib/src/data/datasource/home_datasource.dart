import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class HomeDatasource {
  HomeDatasource();
  Future<Map<String, dynamic>> getHomeData({required String token}) async {
    try {
      final Uri uri = Uri.parse('${dotenv.env['HOMEDATA']!}products');
      final Response response = await get(
        uri,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final String bytes = utf8.decode(response.bodyBytes);
        return jsonDecode(bytes);
      } else {
        print(response.body);
        throw Exception('error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
