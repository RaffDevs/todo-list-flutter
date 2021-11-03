main() {
  final p1 = Pessoa(idade: 24);

  p1.addCamisas('roxa');
  p1.addCamisas('azul');
  p1.addCamisas('vermelha');
  p1.addCamisas('amarela');
  p1.addCamisas('verde');

  recebeCamisas(p1);
  testeClasse();
}

void recebeCamisas(Pessoa pessoa) {
  final camisas = Pessoa.camisas;

  camisas.add('Blue');
  camisas.add('Red');

  print(camisas);
  pessoa.listaCamisas();
}

void testeClasse() {
  final shirts = Pessoa.camisas;
  print(shirts);
}

class Pessoa {
  final int idade;

  static List camisas = [];

  static get pegaCamisas {
    return camisas;
  }

  void listaCamisas() {
    print(camisas);
  }

  void addCamisas(String camisa) {
    camisas.add(camisa);
  }

  Pessoa({
    required this.idade
  });
}