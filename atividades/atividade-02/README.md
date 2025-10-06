
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
    };
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": _nome,
      "dependentes": _dependentes.map((d) => d.toJson()).toList(),
    };
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map<String, dynamic> toJson() {
    return {
      "nomeProjeto": _nomeProjeto,
      "funcionarios": _funcionarios.map((f) => f.toJson()).toList(),
    };
  }
}

void main() {
  
  var dep1 = Dependente("João Filho");
  var dep2 = Dependente("Maria Filha");
  var dep3 = Dependente("Pedro Filho");

  var dep4 = Dependente("Ana Filha");
  var dep5 = Dependente("Lucas Filho");


  var func1 = Funcionario("Carlos Silva", [dep1, dep2, dep3]);
  var func2 = Funcionario("Fernanda Souza", [dep4, dep5]);
  var func3 = Funcionario("Ricardo Lima", []);

 
  var listaFuncionarios = [func1, func2, func3];

  
  var equipe = EquipeProjeto("Sistema de Gestão TI", listaFuncionarios);
String jsonEquipe = jsonEncode(equipe.toJson());

  print(jsonEquipe);
}
