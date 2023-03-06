import 'dart:convert';
import 'dart:developer';
import 'package:chamados/models/user_model.dart';
import 'package:dio/dio.dart';

import './user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  @override
  Future<UserModel> getUser(String id) async {
    try {
      final result = await Dio().get('http://localhost:8080/user/$id');      
      return UserModel.fromMap(result.data);
    } on DioError catch (e) {
      log('http://localhost:8080/user/$id');
      log("Erro ao buscar usuário", error: e);
      throw Exception("Erro ao buscar usuário");
    }
  }
  
  @override
  Future<UserModel> saveUser(UserModel user) async {
    try {
      final result = await Dio().post('http://localhost:8080/user', data: jsonEncode(user.toMap()));      
      return UserModel.fromMap(result.data);
    } on DioError catch (e) {
      log("Erro ao buscar usuário", error: e);
      throw Exception("Erro ao buscar usuário");
    }
  }





}