import 'package:flutter/material.dart';

class cadsenhas extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Cadastro de senhas')),
        body: _body(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          foregroundColor: Colors.black,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      )
    );
  }
  
  _body() {}
}