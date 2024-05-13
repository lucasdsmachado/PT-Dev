import 'package:test/test.dart';

void main() {
  String nome = 'Laranja';
  double peso = 100.2;
  String cor = 'verde';
  String sabor = "Doce e cíctrica";
  int diasDesdeColheita = 40;
  bool isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  Legumes mandioca = Legumes('Macaxeira', 1200, 'Marrom', true);
  Fruta banana = Fruta('Banana', 75, 'Amarela', 'Doce', 12);
  Nozes macadamia = Nozes('Macadâmia', 2, 'Branco Amarelado', 'Doce', 20, 35);
  Citricas limao = Citricas('Limao', 100, 'Verde', 'Azedo', 5, 9);

  macadamia.printAlimento();
  banana.printAlimento();
  mandioca.printAlimento();
  limao.printAlimento();

  mandioca.cozinhar();
  limao.fazerSuco();
  banana.separarIngredientes();
  macadamia.fazerMassa();
}

int funcEstaMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = dias - diasParaMadura;

  return quantosDiasFaltam;
}

String toString(String nome, double peso, int diasDesdeColheita,
    int quantosDiasMadura, bool isMadura) {
  String frase = 'nome: $nome \n'
      'peso: $peso\n'
      'diasDesdeColheita: $diasDesdeColheita\n'
      'diasParaMadura: $quantosDiasMadura\n'
      'isMadura: $isMadura\n';

  return frase;
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print('A $nome está madura.');
  } else {
    print('A $nome não está madura.');
  }

  if (cor != null) {
    print('A $nome é $cor.');
  }
}

bool funcQuantosDiasMadura(int dias) {
  return dias >= 30;
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Fruta(super.nome, super.peso, super.cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura});

  void estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        'A sua fruta foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura');
  }

  void fazerSuco() {
    print('Você fez um ótimo suco de $nome');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }

  @override
  void fazerMassa() {
    print('Misturar a $nome com farinha, açúcar, ovos...');
  }

  @override
  void separarIngredientes() {
    print('Catar a $nome');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas e é $cor.');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(super.nome, super.peso, super.cor, this.isPrecisaCozinhar);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando!');
    } else {
      print('Nem precisa cozinhar!');
    }
  }

  @override
  void assar() {}

  @override
  void fazerMassa() {}

  @override
  void separarIngredientes() {}
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(super.nome, super.peso, super.cor, super.sabor,
      super.diasDesdeColheita, this.nivelAzedo);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe Refrigerante de $nome');
    } else {
      print('Não existe Refrigerante de $nome');
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(super.nome, super.peso, super.cor, super.sabor, super.diasDesdeColheita,
      this.porcentagemOleoNatural);

  @override
  void fazerMassa() {
    print('Tirar a casca');
    super.fazerMassa();
  }
}

abstract class Bolo {
  // separo os ingredientes
  void separarIngredientes();
  // faço a massa
  void fazerMassa();
  // assar
  void assar();
}
