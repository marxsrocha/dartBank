import 'package:console/controller/controller.dart';

import 'controller/client.dart';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) {
  print("XXXXXXXXXXXXXXXXXXX");
  print("Welcome a Dart Bank");
  print("XXXXXXXXXXXXXXXXXXX");
  sleep(Duration(seconds: 3));
  stdout.writeln();

  int? c;
  while (true) {
    print("Choose an option:");
    print("1 - Register");
    print("2 - Login");

    c = int.tryParse(stdin.readLineSync()!);

    if (c == null) {
      print("Invalid option. Please choose 1 or 2.");
      continue;
    }

    if (c == 1) {
      print("Type your name");
      String? nregister = stdin.readLineSync()!;
      print("Type your password");
      String? pregister = stdin.readLineSync()!;
      print("Type your CPF");
      int? cregister = int.parse(stdin.readLineSync()!);
      print("Type your date of birth");
      String? dregister = stdin.readLineSync()!;
      print("Type your gender");
      String? gregister = stdin.readLineSync()!;
      print("Type your contact");
      int? ctregister = int.parse(stdin.readLineSync()!);
      cadastrarCliente(
          nregister, cregister, dregister, ctregister, gregister, pregister);
      break;
    } else if (c == 2) {
      print("Type your CPF");
      int? cpf = int.parse(stdin.readLineSync()!);
      print("Type your password");
      String? senha = stdin.readLineSync()!;
      loginCliente(cpf, senha);
      break;
    } else {
      print("Invalid option. Please choose 1 or 2.");
    }
  }
}
