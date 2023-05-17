import 'package:flutter/material.dart';

import './senha_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'data_constantes.dart';
import 'database_connection.dart';

class senhaSQLiteDatasource {
  Future inserirSenha(descricao, login, senha) async {
    final Database db = await DatabaseConnection.getDatabase();
    try {
      senha.senhaID = await db.rawInsert('''insert into $SENHA_TABLE_NAME(
              $SENHA_COLUMN_DESCRICAO,
              $SENHA_COLUMN_LOGIN,
              $SENHA_COLUMN_SENHA)
              values(
                '${senha.descricao}','${senha.login}','${senha.senha}') 
              ''');
      queryAllRows();
    } catch (ex) {
      return;
    }
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final Database db = await DatabaseConnection.getDatabase();
    return await db.query(SENHA_TABLE_NAME);
  }

  Future<List<SenhaEntity>> getAllSenha() async {
    final Database db = await DatabaseConnection.getDatabase();
    List<Map> dbResult = await db.rawQuery('SELECT * from $SENHA_TABLE_NAME');

    List<SenhaEntity> senhas = [];
    for (var row in dbResult) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

  Future<void> atualizarSenha(SenhaEntity senha) async {
    final Database db = await DatabaseConnection.getDatabase();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'update $SENHA_TABLE_NAME set $SENHA_COLUMN_DESCRICAO = ?, $SENHA_COLUMN_LOGIN = ?, $SENHA_COLUMN_SENHA = ? where id = ?',
          [senha.descricao, senha.login, senha.senha]);
    });
  }

  Future<void> deletarSenha(SenhaEntity senha) async {
    final Database db = await DatabaseConnection.getDatabase();
    await db.transaction((txn) async {
      await txn.rawUpdate(
          'delete from $SENHA_TABLE_NAME where id = ?', [senha.senhaID]);
    });
  }

  Future<void> deletarSenhas() async {
    final Database db = await DatabaseConnection.getDatabase();
    await db.transaction((txn) async {
      await txn.rawUpdate('delete from $SENHA_TABLE_NAME');
    });
  }

  Future<void> deletarSenhaID(int id) async {
    final Database db = await DatabaseConnection.getDatabase();
    await db.transaction((txn) async {
      await txn.rawUpdate('delete from $SENHA_TABLE_NAME where id = ?', [id]);
    });
  }

  Future<List<SenhaEntity>> pesquisarSenha(String filtro) async {
    List<SenhaEntity> senhas = [];
    final Database db = await DatabaseConnection.getDatabase();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_DESCRICAO like ?',
        ['%$filtro%']);
    for (var row in dbResult) {
      SenhaEntity senha = SenhaEntity();
      senha.senhaID = row['senhaID'];
      senha.descricao = row['descricao'];
      senha.login = row['login'];
      senha.senha = row['senha'];
      senhas.add(senha);
    }
    return senhas;
  }

  Future<bool> getSenhaEmail(String filtro) async {
    final Database db = await DatabaseConnection.getDatabase();
    List<Map> dbResult = await db.rawQuery(
        'SELECT * from $SENHA_TABLE_NAME where $SENHA_COLUMN_LOGIN = ?',
        ['$filtro']);

    if (dbResult.isEmpty)
      return false;
    else
      return true;
  }
}
