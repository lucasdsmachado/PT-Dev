import 'good_manners.dart';

class MathQuestions {
  bool isMathQuestion = false;
  String question;
  MathQuestions(this.question);

  bool isAMathQuestion(question) {
    if (question.contains('*') ||
        question.contains('+') ||
        question.contains('-') ||
        question.contains('/')) {
      isMathQuestion = true;
    }

    return isMathQuestion;
  }

  mathCalcAnswer(question) {
    RegExp regex = RegExp(r'\s*(\d+|[+\-*/])\s*');
    Iterable<Match> matches = regex.allMatches(question);
    List<String> tokens = [];
    double resultado = 0;

    for (Match match in matches) {
      tokens.add(match.group(1)!);
    }

    resultado = double.parse(tokens[0]);

    for (int i = 1; i < tokens.length; i += 2) {
      String operador = tokens[i];
      double valor = double.parse(tokens[i + 1]);

      switch (operador) {
        case '+':
          resultado += valor;
          break;
        case '-':
          resultado -= valor;
          break;
        case '*':
          resultado *= valor;
          break;
        case '/':
          resultado /= valor;
          break;
        default:
          throw FormatException("Operador inválido");
      }
    }

    print(resultado);
  }
  
  Future<double> mathCalcAnswerAsync(String question) async {
    return Future.delayed(Duration(seconds: 1), () {
      RegExp regex = RegExp(r'\s*(\d+|[+\-*/])\s*');
      Iterable<Match> matches = regex.allMatches(question);
      List<String> tokens = [];
      double resultado = 0;
      for (Match match in matches) {
        tokens.add(match.group(1)!);
      }
      resultado = double.parse(tokens[0]);
      for (int i = 1; i < tokens.length; i += 2) {
        String operador = tokens[i];
        double valor = double.parse(tokens[i + 1]);
        switch (operador) {
          case '+':
            resultado += valor;
            break;
          case '-':
            resultado -= valor;
            break;
          case '*':
            resultado *= valor;
            break;
          case '/':
            resultado /= valor;
            break;
          default:
            throw FormatException("Invalid operator");
        }
      }
      return resultado;
    });
  }
}
