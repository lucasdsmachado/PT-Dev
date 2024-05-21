import 'dart:async';

void main() {
  Future<String> myFunc(isLigado) async {
    try {
      if (!isLigado) {
        throw Exception();
      }
      print('Harry: Baby, you light up my world like nobody else');
      await Future.delayed(Duration(seconds: 1));
      print('Zayn: The way that you flip your hair gets me overwhelmed');
      await Future.delayed(Duration(seconds: 1));
      print('Liam: But when you smile at the ground, it ain\'t hard to tell');
      await Future.delayed(Duration(seconds: 1));
      print('Louis: You don\'t know, oh, oh');
    } catch (e) {
      print('Alguém desligou o som :(');
    } finally {
      print('...');
    }
    return isLigado ? 'Niall: You don\'t know you\'re beautiful!' : 'Nada para ouvir aqui';
  }

  myFunc(false).then((value) => print(value));
}
