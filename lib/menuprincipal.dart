import 'cadcartoes.dart';
import 'perfilusuario.dart';
import 'geradorsenha.dart';
import 'package:flutter/material.dart';

class menuprincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Nome"),
                  accountEmail: Text("nome@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3524/3524752.png'),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.star),
                    title: Text("Favoritos"),
                    subtitle: Text("Meus favoritos ..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      debugPrint('toquei no drawer');
                    }),
                ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("Perfil"),
                    subtitle: Text("Perfil do usuário..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return perfilUsuario();
                      }));
                    }),
                ListTile(
                    leading: Icon(Icons.credit_card),
                    title: Text("Cartões"),
                    subtitle: Text("Cartões do usuário..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return cadcartoes();
                      }));
                    }),
                    ListTile(
                    leading: Icon(Icons.password_rounded),
                    title: Text("Gerador de Senhas"),
                    subtitle: Text("Gerador de Senhas..."),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return geradorSenha();
                      }));
                    }),
              ],
            ),
          ),
          appBar: AppBar(
              backgroundColor:Color.fromARGB(108, 67, 160, 129),
              title: const Text('Menu Principal')),
          body: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(108, 67, 160, 129),
              ),
              child: Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Minha conta",
                  backgroundColor:Color.fromARGB(108, 67, 160, 129)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.password),
                  label: "Senhas",
                  backgroundColor: Color.fromARGB(108, 67, 160, 129)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card),
                  label: "Cartões",
                  backgroundColor: Color.fromARGB(108, 67, 160, 129)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favoritos",
                  backgroundColor: Color.fromARGB(108, 67, 160, 129)),
            ],
          )),
    );
  }
}
