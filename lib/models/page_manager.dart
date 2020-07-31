import 'package:flutter/cupertino.dart';

class PageManager {
  PageManager(this._pageController);

  // Salva o PageController
  PageController _pageController;

  int page = 0;

  void setPage(int value) {
    if (value == page) return;

    // Valor que pode ser recuperado em qq local do App que informa a página que o usuário está logado
    page = value;

    _pageController.jumpToPage(value);
  }
}
