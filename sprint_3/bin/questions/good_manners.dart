class GoodManners {
  String question;
  bool isThisGoodManners = false;
  String kakoBot = 'KakoBOT:\n';
  GoodManners(this.question);

  bool isThisManners() {
    if (question.contains('oi') ||
        question.contains('ola') ||
        question.contains('Oi') ||
        question.contains('Ola') ||
        question.contains('obrigado') ||
        question.contains('obrigada') ||
        question.contains('Obrigado') ||
        question.contains('Obrigada') ||
        question.contains('bom') ||
        question.contains('boa') ||
        question.contains('tarde') ||
        question.contains('noite') ||
        question.contains('de nada')) {
      isThisGoodManners = true;
    }
    return isThisGoodManners;
  }

  goodManners() {
    if (question.contains('Bom dia') || question.contains('bom dia')) {
      return kakoBot + ' Bom dia Flor do dia!';
    } else if (question.contains('Boa tarde') || question.contains('boa tarde')) {
      return kakoBot + 'Opa sô, boa tarde!';
    } else if (question.contains('Boa noite') || question.contains('boa noite')) {
      return kakoBot + 'Uma bela noite, não é mesmo?';
    } else if (question.contains('Oi') || question.contains('oi') || question.contains('Ola') || question.contains('ola')) {
      return kakoBot + 'Muito prazer!';
    } else if (question.contains('obrigado') || question.contains('Obrigado') || question.contains('Obrigada') || question.contains('obrigada')) {
      return kakoBot + 'De nada, fique à vontade c:';
    }
  }
}
