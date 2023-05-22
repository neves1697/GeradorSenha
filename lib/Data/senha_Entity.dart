import 'package:flutter/material.dart';

class SenhaEntity {
  late int senhaID;
  late String? descricao;
  late String? _login;

  String? get login => _login;

  set login(String? value) {
    _login = value;
  }

  late String? senha;

  SenhaEntity({
    this.descricao,
    String? login,
    this.senha,
  }) : _login = login;
}
