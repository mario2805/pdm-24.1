// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
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
      'nome': _nome,
      'dependentes':
          _dependentes.map((dependente) => dependente.toJson()).toList(),
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
      'nomeProjeto': _nomeProjeto,
      'funcionarios':
          _funcionarios.map((funcionario) => funcionario.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente dep1 = new Dependente("Maria");
  Dependente dep2 = new Dependente("Carlos");
  Dependente dep3 = new Dependente("Felipe");
  Dependente dep4 = new Dependente("Marcos");
  Dependente dep5 = new Dependente("Manuel");
  Dependente dep6 = new Dependente("Luiza");

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  Funcionario func1 = new Funcionario("Lucas", [dep1, dep2]);
  Funcionario func2 = new Funcionario("Cristovão", [dep3, dep4, dep5]);
  Funcionario func3 = new Funcionario("Luciana", [dep6]);

  // 4. Criar uma lista de Funcionarios
  var myFuncionarios = [func1, func2, func3];

  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
  var equipeProjeto = EquipeProjeto("Projeto 1", myFuncionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  var printEquipe = jsonEncode(equipeProjeto.toJson());
  print(printEquipe);
}
