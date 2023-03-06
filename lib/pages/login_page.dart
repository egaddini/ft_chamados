import 'package:chamados/pallete.dart';
import 'package:flutter/material.dart';
import 'package:chamados/widgets/gradient_button.dart';
import 'package:chamados/widgets/login_field.dart';
import 'package:chamados/widgets/social_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const socialButton = const SocialButton(iconPath: 'assets/svgs/g_logo.svg', label: 'Entrar com Google');
    return Scaffold(
      appBar: AppBar(
                title: const Text(''),
                backgroundColor: Pallete.gradient3,
              ),     
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/log.png'),
              const Text(
                'Fazer login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 15),
              socialButton,
              const SizedBox(height: 15),
              const Text(
                'ou',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Usuario ou Email'),
              const SizedBox(height: 10),
              const LoginField(hintText: 'Senha'),
              const SizedBox(height: 20),
              const GradientButton(),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, 'singup');
                }, 
                  child: const Text('Criar Conta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}