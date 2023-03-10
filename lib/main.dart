import 'package:chamados/pages/home_page.dart';
import 'package:chamados/pages/login_page.dart';
import 'package:chamados/pages/singup_page.dart';
import 'package:chamados/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chamados',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(_) => const LoginPage(),
        'login':(_) => const LoginPage(),
        'singup':(_) => const SingupPage(),
        //'/page3':(_) => const Page3(),
      },
    );
  }
}
