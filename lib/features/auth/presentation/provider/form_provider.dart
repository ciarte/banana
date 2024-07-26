import 'package:banana/core/theme/app_pallete.dart';
import 'package:banana/features/auth/data/datasource/aut_api_service.dart';
import 'package:flutter/material.dart';

class FormProvider with ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
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

      bool credentialsValid = await AuthenticationApiService.verifyCredentials(
          _username, _password);

      _isLoading = false;
      if (credentialsValid) {
        // Navigate to the next screen
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, '/products');
        }
      } else {
        _invalidCredentials = true;
        notifyListeners();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Credentials'),
              backgroundColor: AppPallete.errorColor,
            ),
          );
        }
      }
    }
  }
}
