import 'package:chamados/models/user_model.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {

  const UserPage({ super.key });

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  final formKey = GlobalKey<FormState>();
  
  final idEC = TextEditingController();

  @override
  void dispose() {
    idEC.dispose();
    super.dispose();
  }

  final UserRepository userRepository = UserRepositoryImpl();
  UserModel? userModel;

   @override
   Widget build(BuildContext context) {
       return Scaffold(
          appBar: AppBar(title: const Text('Buscar Usuario'),),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: idEC,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'id Obrigatório';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final valid = formKey.currentState?.validate() ?? false;
                      if (valid) {
                        try {
                          final user = await userRepository.getUser(idEC.text);
                          setState(() {
                          userModel = user;
                        });
                        } catch (e) {
                          setState(() {
                            userModel = null;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao buscar usuário")));
                        }
                      }
                    },
                    child: const Text('Buscar')
                  ),
                  Visibility(
                    visible: userModel != null,
                    child: Text(
                      '${userModel?.name} ${userModel?.surname} ${userModel?.email}',
                    )
                    )                  

                ],
              ),
            ),
          ),
       );
  }
}