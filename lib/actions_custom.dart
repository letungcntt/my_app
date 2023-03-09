import 'package:flutter/material.dart';

class ShowSearchIntent extends Intent {
  const ShowSearchIntent(this.visible);

  final bool visible;
}

class ShowSearchAction extends Action<ShowSearchIntent> {
  ShowSearchAction(this.function);

  final Function(bool) function;

  @override
  void invoke(ShowSearchIntent intent) {
    function(intent.visible); 
  }
}

class DismissViewIntent extends DismissIntent {
  const DismissViewIntent();
}

class DismissViewAction extends Action<DismissViewIntent> {
  DismissViewAction(this.function);

  final Function() function;

  @override
  void invoke(DismissIntent intent) {
    function();
  }
}

class SelectTabIntent extends Intent {
  const SelectTabIntent(this.tab);

  final int tab;
}


class SelectTabAction extends Action<SelectTabIntent> {
  SelectTabAction(this.func); 

  final Function(int) func;

  @override
  void invoke(SelectTabIntent intent) {
    func(intent.tab);
  }
}
