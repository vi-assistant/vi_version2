import 'package:flutter/material.dart';
import 'package:vi_assistant/utils/utils.dart';

class Cont extends PageController {
  void goNext() {
    nextPage(duration: animDuration, curve: Curves.easeIn);
  }

  void goBack() {
    previousPage(duration: animDuration, curve: Curves.easeIn);
  }
}

class PageCont {
  static final Cont login = Cont();
  static final Cont signup = Cont();
}
