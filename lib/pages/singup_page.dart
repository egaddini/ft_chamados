import 'package:chamados/models/user_model.dart';
import 'package:chamados/pallete.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:chamados/validators/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class SingupPage extends StatefulWidget {


  const SingupPage({ Key? key }) : super(key: key);

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _surnameEC = TextEditingController();
  final _usernameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

    final UserRepository userRepository = UserRepositoryImpl();
    UserModel? userModel;

  @override
  void dispose() {
    _nameEC.dispose();
    _surnameEC.dispose();
    _usernameEC.dispose();
    _phoneEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
              appBar: AppBar(
                title: const Text(''),
                backgroundColor: Pallete.gradient3,
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Container(
                      width: 400,
                      child: Column(
                        children: [
                          const Text(
                            'Criar sua conta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),                       
                          const SizedBox(height: 20),                            
                          TextFormField(
                            controller: _nameEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Nome',
                              border: OutlineInputBorder(),
                              ),
                            validator: Validatorless.required('Nome Obrigatório'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _surnameEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Sobrenome',
                              border: OutlineInputBorder(),
                            ),
                            validator: Validatorless.required('Sobrenome Obrigatório'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _usernameEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Usuario',
                              border: OutlineInputBorder(),
                            ),
                            validator: Validatorless.required('Usuario Obrigatório'),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _phoneEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Telefone',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _emailEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Email',
                              border: OutlineInputBorder(),
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email invalido'),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _passwordEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Senha',
                              border: OutlineInputBorder(),
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6, 'Senha precisa ter no minimo 6 caracteres'),
                            ]),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _confirmPasswordEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              labelText:'Confirma Senha',
                              border: OutlineInputBorder(),
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Confirmar senha obrigatória'),
                              Validatorless.min(6, 'Confirmar senha precisa ter no minimo 6 caracteres'),
                              Validators.compare(_passwordEC, 'Senhas não conferem'),
                            ]),
                          ),
                          const SizedBox(height: 15),
                          Column(
                           
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                var formValid = _formKey.currentState?.validate() ?? false;
                           
                                if (formValid) {
                                  setState(() {
                                    userModel = UserModel(
                                      name: _nameEC.text,
                                      surname: _surnameEC.text,
                                      username: _usernameEC.text,
                                      email: _emailEC.text,
                                      phone: _phoneEC.text,
                                      password: _passwordEC.text
                                    );
                                  });                      
                                      
                                  var response = await userRepository.saveUser(userModel!);
                                  
                                }
                           
                              }, child: const Text('Salvar')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
  }
}