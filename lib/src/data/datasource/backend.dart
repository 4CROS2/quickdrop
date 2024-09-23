import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Backend {
  Backend({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;
  final FirebaseAuth _firebaseAuth;
  Future<Map<String, dynamic>> backend() async {
    try {
      final Uri uri = Uri.parse(
        'https://14g8gz7z-4321.use2.devtunnels.ms/orders',
      );
      final String? token = await _firebaseAuth.currentUser!.getIdToken();
      final http.Response response = await http.post(
        uri,
        headers: <String, String>{
          'Authorization': 'Bearer $token', // Agrega el token al encabezado
          'Content-Type':
              'application/json', // Asegúrate de establecer el tipo de contenido correcto
        },
        body: jsonEncode(<String, Object>{
          'userId': _firebaseAuth.currentUser!.uid,
          'products': <dynamic>[
            <String, Object>{
              'name': 'salchipapa',
              'quantity': 2,
              'price': 22000
            }
          ],
        }),
      );
    } catch (e) {
      rethrow;
    }
    return <String, dynamic>{};
  }
}
