import 'package:chamados/models/user_model.dart';

abstract class UserRepository {

  Future<UserModel> getUser(String id);

  Future<UserModel> saveUser(UserModel user);

}