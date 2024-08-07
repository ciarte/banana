import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const UsernameField({
    Key? key,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a username';
            } else if (value.length <= 4) {
              return 'Username must be longer than 5 characters';
            } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
              return 'Username can only contain letters or numbers';
            }
            return null;
          },
      onSaved: onSaved,
      decoration: const InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(Icons.assignment_ind_outlined),
      ),
    );
  }
}
