import 'package:chamados/models/login_model.dart';
import 'package:chamados/models/user_model.dart';
import 'package:chamados/pallete.dart';
import 'package:chamados/repositories/auth_repository.dart';
import 'package:chamados/repositories/auth_repository_impl.dart';
import 'package:chamados/repositories/user_repository.dart';
import 'package:chamados/repositories/user_repository_impl.dart';
import 'package:chamados/validators/validators.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {


  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  final AuthRepository authRepository = AuthRepositoryImpl();

  LoginModel? loginModel;
  bool _obscureText = true;

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
              appBar: null,
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Container(
                      width: 400,
                      child: Column(
                        children: [
                          const SizedBox(height: 150),
                          const Text(
                            'Welcome Back',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),                       
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _emailEC,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(23),
                              labelText:'Email',
                              labelStyle: TextStyle(
                                color: Pallete.gradient3,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Pallete.gradient3,
                                width: 2,
                                ),
                              ),
                              
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email invalido'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordEC,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(23),
                              labelText:'Senha',
                              labelStyle: const TextStyle(
                                color: Pallete.gradient3,
                              ),
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Pallete.gradient3,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              ), 
                            ),
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória'),
                              Validatorless.min(6, 'Senha precisa ter no minimo 6 caracteres'),
                            ]),
                          ),
                          const SizedBox(height: 20),
                          Column(                           
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(
                                    const Size(410, 65),
                                  ),
                                backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3),                                    
                                ),
                                child: const Text(
                                  'Continuar',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                onPressed: () async {
                                var formValid = _formKey.currentState?.validate() ?? false;
                                  if (formValid) {
                                    setState(() {
                                      loginModel = LoginModel(
                                        email: _emailEC.text,
                                        password: _passwordEC.text
                                      );
                                    });                      
                                    var response = await authRepository.authenticate(loginModel!);
                                  } 
                                }, 
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text('Não tem uma conta?'),
                              TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, 'singup');
                                }, 
                                child: const Text(
                                  'Entre aqui',
                                  style: TextStyle(
                                    color: Pallete.gradient3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Expanded(child:Divider(),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  'OU',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(child:Divider(),),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Adicione aqui a lógica de autenticação com o Google.
                            },
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(410, 65),
                              ),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3.0),
                                  side: const BorderSide(color: Color(0xFFBDBDBD)),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.g_translate,
                                  color: Pallete.borderColor,
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  'Entrar com o Google',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Pallete.borderColor),
                                ),
                              ],
                            ),
                          ),


                          /*const SizedBox(height: 25),
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
                              }, child: const Text('Entrar')),
                            ],
                          ),*/
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
  }
}