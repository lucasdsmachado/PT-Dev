import 'dart:math';

class BotClock {
  Future clock(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  Stream kakoBotStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('A Stream terminou.');
  }
  
  Stream<String> randomInfoStream() async* {
    var random = Random();
    while (true) {
      await Future.delayed(Duration(
          seconds: random.nextInt(6) + 5));
      var infoList = [
        'KakoBOT: Estou aqui para te ajudar!',
        'KakoBOT: Posso responder perguntas sobre tempo, matemática e boas maneiras.',
        'KakoBOT: Vamos jogar pedra, papel e tesoura!',
        'KakoBOT: Se precisar de algo, estou sempre disponível.',
        'KakoBOT: Como posso ajudar hoje?',
      ];
      var errorChance = random.nextDouble();
      if (errorChance < 0.2) {
        // 20% de chance de erro
        yield* Stream.error('Erro na resposta do KakoBOT!');
      } else {
        var randomIndex = random.nextInt(infoList.length);
        yield infoList[randomIndex];
      }
    }
  }
}
