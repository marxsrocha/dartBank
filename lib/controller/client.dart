import 'package:uuid/uuid.dart';

class Cliente {
  String id;
  String nome;
  int cpf;
  String dataDeNascimento;
  String sexo;
  String senha;
  int fone;

  Cliente(
    this.nome,
    this.cpf,
    this.dataDeNascimento,
    this.fone,
    this.sexo,
    this.senha,
  ) : id = Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'cpf': cpf,
      'datadenascimento': dataDeNascimento,
      'fone': fone,
      'sexo': sexo,
      'senha': senha,
    };
  }

  static Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(
      map['nome'],
      map['cpf'],
      map['datadenascimento'],
      map['fone'],
      map['sexo'],
      map['senha'],
    );
  }

  String get getNome => nome;
  int get getCpf => cpf;
  String get getDataDeNascimento => dataDeNascimento;
  String get getSexo => sexo;
  int get getFone => fone;
  String get getSenha => senha;

  set setNome(String nome) => this.nome = nome;
  set setCpf(int cpf) => this.cpf = cpf;
  set setDataDeNascimento(String data) => this.dataDeNascimento = data;
  set setSexo(String sexo) => this.sexo = sexo;
  set setFone(int fone) => this.fone = fone;
  set setSenha(String senha) => this.senha = senha;
}
