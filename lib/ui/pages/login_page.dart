import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/login_request_body.dart';
import 'package:test_app/repository/login_repository.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final textFieldKey = TextEditingController();

  void onLoginTap() {
    if (_formKey.currentState!.validate()) {
      ref
          .watch(loginRepositoryProvider.notifier)
          .login(
            LoginRequestBody(
              textFieldKey.text,
            ),
          )
          .onError(
        (error, stacktrace) {
          if (mounted) {
            showAdaptiveDialog(
              context: context,
              builder: (context) => AlertDialog.adaptive(
                content: Center(
                  child: Text('Wrong username, please, try again.'),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
      );
    }
  }

  Widget buildLoginButton() => ElevatedButton(
        onPressed: () => onLoginTap(),
        child: switch (ref.watch(loginRepositoryProvider)) {
          LoginState.initial => Text('Login'),
          LoginState.loading => CircularProgressIndicator(),
          LoginState.success => Text('Success'),
          LoginState.error => Text('Error'),
        },
      );

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(
      loginRepositoryProvider,
      (previous, next) {
        if (next == LoginState.success) {
          Navigator.pushNamed(context, '/chat');
        }
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: textFieldKey,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    buildLoginButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
