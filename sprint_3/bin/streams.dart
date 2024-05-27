import 'dart:async';
import 'dart:math';

Stream<int> timedCounter(int interval, [int? maxCount]) async* {
  //A partir do momento que alguem estiver ouvindo
  // essa função o corpo começa a contar

  ///Ou seja, como regra, toda Stream precisa ter
  ///um subscriber (alguem que escuta) antes de começar a rodar.
  ///Isso ocorre porque caso a Stream esteja rodando e ninguem esta vendo
  ///estamos gastando recursos preciosos a troco de nada.
  int i = 1;
  while (i != maxCount) {
    await Future.delayed(Duration(seconds: interval));
    yield i++;
    // caso alguem de fora cancele (pare de ouvir) ele retorna o ultimo valor e encerra a Stream.
    //caso alguem pause a Stream, o loop vai ficar congelado no yield até segunda ordem.
  }
  // print('Acabou!'); A responsabilidade da mensagem deve ser da Stream?
}

void main() async {
  Stream myStream(int interval, [int? maxCount]) async* {
    int i = 1;
    while (i != maxCount) {
      print('Counting $i');
      await Future.delayed(Duration(seconds: interval));
      yield i++;
    }
    print('The Stream is finished');
  }

  var kakoStream = myStream(1).asBroadcastStream();
  StreamSubscription subscription = kakoStream.listen(
      (event) {
        if (event.isEven) {
          print('This number is even!');
        }
      },
      onError: (e) {
        print('An error happened: $e');
      },
      cancelOnError: false,
      onDone: () {
        print('The subscriber is gone!');
      });

  await Future.delayed(Duration(seconds: 3));
  subscription.pause();
  print('Stream paused');
  await Future.delayed(Duration(seconds: 3));
  subscription.resume();
  print('Stream resumed');
  await Future.delayed(Duration(seconds: 3));
  subscription.cancel();
  print('Stream canceled');

  kakoStream.map((event) => 'Subscriber 2 watching: $event').listen(print);

  print('Main is finished');
}
