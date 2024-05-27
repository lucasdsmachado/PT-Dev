import 'dart:io';

import 'questions/good_manners.dart';
import 'questions/math_questions.dart';
import 'questions/rock_paper_scissors.dart';
import 'questions/time_questions.dart';
import 'timing/waiting_time.dart';

void main() async {
  String kakoBot = 'KakoBOT:\n';
  var a = true;
  String usuario = '';

  var myStream = BotClock().kakoBotStream(1, 10);
  var subscriber = myStream.listen((event) {
    print(
        '                     Kakobot está ativo a: $event segundos                     ');
  }, onDone: () {
    print('Kakobot está sendo finalizado! Faça a última pergunta');
    a = false;
  });
  var randomInfoStream = BotClock().randomInfoStream();
  var newSubscriber = randomInfoStream.listen((event) {
    print(event);
  }, onError: (err) {
    print('Erro na stream: $err');
  });
  
  print('-- Iniciando o KakoBOT, aguarde..--');
  await BotClock().clock(2);
  print('KakoBOT:\n Oi :) \n Como posso ajudar?');
  do {
    usuario = stdin.readLineSync().toString();
    print('-- Processando pergunta, aguarde..--');
    await BotClock().clock(1);
    if (usuario.contains('xau') ||
        usuario.contains('Xau') ||
        usuario.contains('Adeus') ||
        usuario.contains('adeus')) {
      a = false;
      print(kakoBot + ' Até a proxima!!');
    } else if (TimeQuestions(usuario).isThisTime()) {
      // verificar antes, assim não fazemos toda a função sem precisar.
      TimeQuestions(usuario).timeQuestion();
      await BotClock().clock(2);
    } else if (GoodManners(usuario).isThisManners()) {
      GoodManners(usuario).goodManners();
    } else if (MathQuestions(usuario).isAMathQuestion(usuario)) {
      MathQuestions(usuario).mathCalcAnswerAsync(usuario).then(print);
    } else if (RPS(usuario).isWannaPlay(usuario)) {
      RPS(usuario).playGame();
      await BotClock().clock(2);
    } else if (usuario.contains('sabe') || usuario.contains('conhece')) {
      print(
          'KakoBOT: Ah... Eu sei muitas coisas: Sei falar sobre a o dia, a hora, o ano, cálculos matemáticos..');
      print(
          'KakoBOT: Ah! Eu sei boas maneiras e jogar pedra papel e tesoura também');
    } else {
      await BotClock().clock(2);
      print(kakoBot +
          ' Não fui treinado para responder a essa pergunta \n Desculpe :( ');
      print(kakoBot + ' Você pode fazer outra pergunta ou dizer Adeus');
    }
  } while (a);

  print('--Encerrando KakoBOT--');
}
