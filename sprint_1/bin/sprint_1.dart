void main() {

  /// Comentário de documentação
  /** Novo Comentário de Múltiplas linhas **/
  // Informações sobre a nossa persona

  int idade = 25;
  double altura = 1.82;
  bool geek = false;
  const String nome = 'Brian Machado';
  final String apelido;
  apelido = 'Potter';
  bool maiorDeIdade;
  int energia = 100;

  // Método para definir se a Persona é maior de idade
  if (idade >= 18) {
    maiorDeIdade = true;
  } else {
    maiorDeIdade = false;
  }

  // Método para dizer quantas voltas foram dadas
  for (int i = 0; i < 5; i++) {
    print('Conclui $i voltas');
  }

  // Método para retirar a energia da Persona
  while (energia > 0) {
    print('Mais uma Repetição');
    energia -= 6;
  }

  // Exemplo de outra forma de usar o While
  // do {
  //   print('Mais uma Repetição');
  //   energia -= 6;
  // } while (energia > 0);

  // Definimos nossa Lista com todos os Status da Persona
  List<dynamic> potter = [idade, altura, geek, nome, apelido];

  // Frase que recebe todos os dados diretamente da Lista
  String frase = 'Eu sou ${potter[4]}\n'
      'mas meu nome completo é: ${potter[3]}\n'
      'eu me considero geek? ${potter[2]}.\n'
      'Eu tenho ${potter[1]} metros de altura e\n'
      '${potter[0]} de idade\n'
      'Eu sou maior de idade? $maiorDeIdade';

  // List<String> listanomes = ['Ricarth', 'Natália', 'Alex', 'Ândriu', 'André'];
  // TODO: Fazer outras Personas da equipe de Mobile
  print(frase);
}
