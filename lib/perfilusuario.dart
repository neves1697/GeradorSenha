import 'cadusuario.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class perfilUsuario extends StatelessWidget {
  const perfilUsuario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Perfil do usuário',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
      await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Perfil do usuário'),
    ),
    body: SingleChildScrollView(child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(children: [
          Center( 
            child: ElevatedButton(
              onPressed: _openImagePicker,
              child: const Text('Selecione a imagem'),
            ),
            ),
            const SizedBox(height: 35),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : const Text('Por favor selecione a imagem'),
            ),
            const SizedBox(height: 35),
            fieldName(),
            const SizedBox(height: 35),
            fieldEmail(),
            const SizedBox(height: 35),
            fieldSenha(),
            ]),
      ),
    )),
    );
  }
}

Widget fieldEmail() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: 
      InputDecoration(border: OutlineInputBorder(), labelText: 'E-mail'));     
}

Widget fieldSenha() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: 
      InputDecoration(border: OutlineInputBorder(), labelText: 'Senha'));
}

Widget fieldName() {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: 
      InputDecoration(border: OutlineInputBorder(), labelText: 'Nome'));
}