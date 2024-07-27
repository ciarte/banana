import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextCreatedBy extends StatelessWidget {
  const TextCreatedBy({
    super.key,
    required this.product,
  });

  final String product;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 16.0,
        ),
        children: [
          const TextSpan(
            text: 'created by: ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {},
            text: product,
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
