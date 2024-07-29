import 'package:banana/core/presentation/widgets/custom_filled_button.dart';
import 'package:banana/core/theme/app_pallete.dart';
import 'package:banana/features/auth_user/presentation/provider/form_provider.dart';
import 'package:banana/features/auth_user/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  static const String name = 'login';
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<FormProvider>(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formProvider.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(fontSize: 40),
                    ),
                    const Text(
                      'Banana Store',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    UsernameField(
                      onSaved: (value) {
                        formProvider.setUsername(value!);
                      },
                    ),
                    const SizedBox(height: 20),
                    PasswordField(onSaved: (value) {
                      formProvider.setPassword(value!);
                    }),
                    const SizedBox(height: 16.0),
                    formProvider.isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: CustomFilledButton(
                                text: 'Sign in',
                                buttonColor: AppPallete.focusBorderColor,
                                onPressed: () async {
                                  await formProvider.submitForm(context);
                                }),
                          ),
                    const Text.rich(TextSpan(children: [
                      TextSpan(text: 'Don\'t have an account?. '),
                      TextSpan(
                          text: 'Sign up.',
                          style: TextStyle(color: AppPallete.focusBorderColor)),
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
