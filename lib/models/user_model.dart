import 'dart:convert';

class UserModel {
  final String name;
  final String surname;
  final String username;
  final String email;
  final String phone;
  final String password;
  
  UserModel ({
    required this.name,
    required this.surname,
    required this.username,  
    required this.email,  
    required this.phone,  
    required this.password, 
  });
  
  Map<String, dynamic> toMap(){
    return {
      'name':name,
      'surname':surname,
      'username':username,
      'email':email,
      'phone':phone,
      'password':password
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? ''
    );
  }

  factory UserModel.fromJson(String json) => UserModel.fromMap(jsonDecode(json));
  

}