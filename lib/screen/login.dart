import 'package:banana/model/models.dart';
import 'package:flutter/material.dart';
import 'package:banana/auth/validate_user.dart';
import 'package:banana/service/api_services.dart';
import 'package:banana/config/config.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _loginData = LoginData(username: '', password: '');
  bool _invalidCredentials = false;

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Username: ${_loginData.username}');
      print('Password: ${_loginData.password}');
      bool credentialsValid = await ApiService.verifyCredentials(
        _loginData.username,
        _loginData.password,
      );

      if (credentialsValid) {
        Navigator.pushReplacementNamed(context, '/products');
      } else {
        print('Invalid credentials');
        setState(() {
          _invalidCredentials = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme().getTheme();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUsernameField((value) {
                  setState(() {
                    _loginData.username = value;
                    _invalidCredentials = false;
                  });
                }),
                buildPasswordField((value) {
                  setState(() {
                    _loginData.password = value;
                    _invalidCredentials = false;
                  });
                }),
                const SizedBox(height: 16.0),
                ElevatedButtonTheme(
                  data: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primaryColor,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _submitForm();
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                ),
                if (_invalidCredentials)
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Credenciales inválidas',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
