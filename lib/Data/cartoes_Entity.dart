/**
 * 
 * Exemplo
 * import 'dart:html';

class PerfilEntity {
  late int? perfilID;
  final String? nome;
  final String? email;
  final String? senha;
  final Blob? foto;

  PerfilEntity({
    this.nome,
    required this.email,
    required this.senha,
    this.foto,
  });
}
 * 
 */
import 'dart:html';

class CartoesEntity {
  late int? id;
  late final String? descricao;
  late final String? numero;
  late final String? validade;
  late final String? cvv;
  late final String? senha;

  CartoesEntity({
    this.descricao,
    this.numero,
    this.validade,
    this.cvv,
    this.senha,
  });
}

