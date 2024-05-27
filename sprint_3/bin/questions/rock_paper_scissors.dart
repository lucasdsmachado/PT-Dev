import 'dart:io';
import 'dart:math';

class RPS {
  String question;
  bool isPlaying = false;

  RPS(this.question);

  bool isWannaPlay(String question) {
    if (question.contains('jogar') ||
        question.contains('jogo') ||
        question.contains('pedra papel tesoura') ||
        question.contains('pedra, papel e tesoura') ||
        question.contains('pedra, papel, tesoura')) {
      isPlaying = true;
    }
    return isPlaying;
  }

  void playGame() {
    print('Vamos jogar Pedra, Papel e Tesoura!');

    bool playAgain = true;
    while (playAgain) {
      stdout.write('Escolha: pedra, papel ou tesoura? ');
      String playerMove = stdin.readLineSync()!.toLowerCase();

      if (playerMove == 'pedra' ||
          playerMove == 'papel' ||
          playerMove == 'tesoura') {
        String computerMove = getComputerMove();
        print('Computador escolheu: $computerMove');

        String result = calculateResult(playerMove, computerMove);
        print('Resultado: $result');

        stdout.write('Quer jogar novamente? (sim/não) ');
        String answer = stdin.readLineSync()!.toLowerCase();
        playAgain = answer == 'sim';
      } else {
        print('Escolha inválida. Por favor, escolha pedra, papel ou tesoura.');
      }
    }

    print('Obrigado por jogar!');
  }

  String getComputerMove() {
    Random random = Random();
    List<String> moves = ['pedra', 'papel', 'tesoura'];
    return moves[random.nextInt(moves.length)];
  }

  String calculateResult(String playerMove, String computerMove) {
    if (playerMove == computerMove) {
      return 'Empate!';
    } else if ((playerMove == 'pedra' && computerMove == 'tesoura') ||
        (playerMove == 'papel' && computerMove == 'pedra') ||
        (playerMove == 'tesoura' && computerMove == 'papel')) {
      return 'Você ganhou!';
    } else {
      return 'Você perdeu!';
    }
  }
}
