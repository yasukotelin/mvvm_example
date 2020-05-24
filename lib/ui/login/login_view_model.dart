import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/util/state.dart';

class LoginViewModel extends ChangeNotifier {
  UiState _uiState = UiState.Idle;
  UiState get uiState => _uiState;

  bool get isLoginButtonEnabled => uiState != UiState.Loading;

  StreamController<String> _loginSuccessAction = StreamController<String>();
  StreamController<String> get loginSuccessAction => _loginSuccessAction;

  void login() {
    _uiState = UiState.Loading;
    notifyListeners();

    Future.delayed(Duration(milliseconds: 1500)).then((_) {
      // Login Success!
      _uiState = UiState.Loaded;
      notifyListeners();

      _loginSuccessAction.sink.add("success");
    });
  }

  @override
  void dispose() {
    _loginSuccessAction.close();

    super.dispose();
  }
}
