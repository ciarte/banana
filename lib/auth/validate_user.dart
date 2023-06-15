import 'package:flutter/material.dart';

Widget buildUsernameField(void Function(String) onSaved) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter a username';
      } else if (value.length <= 4) {
        return 'Username must be longer than 5 characters';
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        return 'Username can only contain letters or numbers';
      }
      return null;
    },
    onSaved: onSaved != null ? (value) => onSaved(value!) : null,
    decoration: const InputDecoration(
      labelText: 'Username',
      prefixIcon: Icon(Icons.assignment_ind_outlined),
    ),
  );
}

Widget buildPasswordField(void Function(String) onSaved) {
  return TextFormField(
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter a password';
      } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$')
          .hasMatch(value)) {
        return 'Password must contain at least one lowercase letter, one uppercase letter, and one number';
      }
      return null;
    },
    onSaved: onSaved != null ? (value) => onSaved(value!) : null,
    obscureText: true,
    decoration: const InputDecoration(
      labelText: 'Password',
      prefixIcon: Icon(Icons.lock_outline),
    ),
  );
}
