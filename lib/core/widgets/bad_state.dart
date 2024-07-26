import 'package:flutter/widgets.dart';

class BadState extends StatelessWidget {
  final String text;

  const BadState({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [Image.asset('assets/images/banana_sad.png'), Text(text)],
      ),
    );
  }
}
