import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const PasswordField({
    Key? key,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Alterna entre mostrar y ocultar
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
      onSaved: widget.onSaved,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: _toggleVisibility,
        ),
      ),
    );
  }
}
