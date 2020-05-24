import 'package:flutter/material.dart';
import 'package:mvvm_example/ui/login/login_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
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

    var viewModel = Provider.of<LoginViewModel>(context, listen: false);
    viewModel.loginSuccessAction.stream.listen((text) {
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
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return RaisedButton(
          child: Text("Login"),
          onPressed: !viewModel.isLoginButtonEnabled
              ? null
              : () {
                  viewModel.login();
                },
        );
      },
    );
  }
}
