import 'dart:convert';
import 'dart:developer';

import 'package:chamados/models/login_model.dart';
import 'package:dio/dio.dart';

import './auth_repository.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthRepositoryImpl implements AuthRepository {
  final dio = Dio();
  //final String baseUrl = 'http://localhost:8080/api/v1/auth/authenticate';
  
  @override
  Future<String> authenticate(LoginModel login) async {

      // URL do servidor e endpoint
    final String url = 'http://localhost:9090/';

    // Envia uma solicitação GET para a URL especificada
    final response = await http.get(Uri.parse(url));

    // Imprime o status code e a resposta do servidor
    print('Status code: ${response.statusCode}');
    print('Resposta do servidor: ${response.body}');
    
    return "";

  }
  
}
