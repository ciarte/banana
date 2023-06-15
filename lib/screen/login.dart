import 'package:flutter/material.dart';
import 'package:banana/auth/validate_user.dart';
import 'package:banana/service/api_services.dart';
import 'package:banana/model/login_data_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _loginData = LoginData(username: '', password: '');

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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              buildUsernameField((value) {
                setState(() {
                  _loginData.username = value;
                });
              }),
              buildPasswordField((value) {
                setState(() {
                  _loginData.password = value;
                });
              }),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
