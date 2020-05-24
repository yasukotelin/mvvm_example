import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Injects LoginViewModel into this widgets.
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: _LoginPageBody(),
      ),
    );
  }
}

class _LoginPageBody extends StatefulWidget {
  @override
  __LoginPageBodyState createState() => __LoginPageBodyState();
}

class __LoginPageBodyState extends State<_LoginPageBody> {
  @override
  void initState() {
    super.initState();

    // Listen events by view model.
    var viewModel = Provider.of<LoginViewModel>(context, listen: false);
    viewModel.loginSuccessAction.stream.listen((_) {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _LoginButton(),
    );
  }
}

class _LoginButton extends StatelessWidget {
  String _getButtonText(LoginViewModel vm) =>
      vm.isLogging ? "Wait..." : "Login";

  VoidCallback _onPressed(LoginViewModel vm) {
    if (vm.isLogging) {
      // When returning null, the button become disabled.
      return null;
    } else {
      return () {
        vm.login();
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return RaisedButton(
          child: Text(_getButtonText(viewModel)),
          onPressed: _onPressed(viewModel),
        );
      },
    );
  }
}
