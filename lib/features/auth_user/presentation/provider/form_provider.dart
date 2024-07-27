import 'package:banana/features/auth_user/domain/usecase/login_usecase.dart';
import 'package:banana/features/auth_user/domain/entities/user.dart';
import 'package:flutter/material.dart';

import 'package:banana/core/theme/app_pallete.dart';

class FormProvider with ChangeNotifier {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginUseCase loginUseCase;

  FormProvider(this.loginUseCase);

  String _username = '';
  String _password = '';
  bool _isLoading = false;
  bool _invalidCredentials = false;

  GlobalKey<FormState> get formKey => _formKey;
  String get username => _username;
  String get password => _password;
  bool get invalidCredentials => _invalidCredentials;
  bool get isLoading => _isLoading;

  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  bool get isFormValid {
    return _formKey.currentState?.validate() ?? false;
  }

  Future<void> submitForm(BuildContext context) async {
    if (isFormValid) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();

      _isLoading = true;
      _invalidCredentials = false;
      notifyListeners();

      try {
        await loginUseCase.login(_username, _password);

        _isLoading = false;
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/products');
        }
      } catch (e) {
        _isLoading = false;
        _invalidCredentials = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong Credentials, please try again.'),
              backgroundColor: AppPallete.errorColor,
            ),
          );
        }
      }
    }
  }
}
