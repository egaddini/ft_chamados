import 'package:chamados/pallete.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
            appBar: AppBar(
              title: Center(
                child: const Text('Home Page'),
                ),
              backgroundColor: Pallete.gradient3,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, 'login');
                    }, 
                    child: const Text('login'),
                  ),
                ],
              ),
           ),
       );
  }
}