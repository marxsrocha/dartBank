import 'client.dart';
import 'dart:convert';
import 'dart:io';

cadastrarCliente(String nome, int cpf, String data, int contato, String genero,
    String pass) {
  final file = File('clientes.json');
  List<Cliente> clientes =
      (jsonDecode(File('clientes.json').readAsStringSync()) as List)
          .map((clienteJson) => Cliente.fromMap(clienteJson))
          .toList();

  if (file.existsSync()) {
    // Lê o conteúdo do arquivo JSON para obter uma lista de clientes existentes
    final content = file.readAsStringSync();
    final decoder = JsonDecoder();
    final List<dynamic> jsonList = decoder.convert(content);

    // Converte o JSON em uma lista de objetos Cliente
    clientes = jsonList.map((item) => Cliente.fromMap(item)).toList();

    if (clientes.any((cliente) => cliente.getCpf == cpf)) {
      print('Já existe um cliente com este CPF.');
      return;
    }
  }

  // Cria um novo objeto Cliente e o adiciona à lista de clientes existentes
  var cliente = Cliente(nome, cpf, data, contato, genero, pass);
  clientes.add(cliente);

  // Escreve a lista atualizada no arquivo JSON
  final encoder = JsonEncoder.withIndent('  ');
  file.writeAsStringSync(
      encoder.convert(clientes.map((c) => c.toMap()).toList()));
  print('Cadastro realizado com sucesso');
}

bool loginCliente(int cpf, String senha) {
  final file = File('clientes.json');

  if (!file.existsSync()) {
    print('Não existem clientes cadastrados.');
    return false;
  }

  // Lê o conteúdo do arquivo JSON para obter uma lista de clientes existentes
  final content = file.readAsStringSync();
  final decoder = JsonDecoder();
  final jsonList = decoder.convert(content);

  // Converte o JSON em uma lista de objetos Cliente
  final clientes = jsonList.map((item) => Cliente.fromMap(item)).toList();

  // Procura por um cliente com o CPF e a senha informados
  Cliente cliente = clientes.firstWhere(
      (cliente) => cliente.getCpf == cpf && cliente.getSenha == senha,
      orElse: () => null);

  if (cliente == null) {
    print('CPF ou senha inválidos.');
    return false;
  }

  print('Bem-vindo, ${cliente.getNome}!');
  return true;
}
