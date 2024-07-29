import 'package:banana/core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  final String routeName;
  final String text;

  const NotFoundScreen(
      {super.key, required this.routeName, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BadState(text: text),
            const SizedBox(height: 20),
            CustomFilledButton(
                text: 'Back to Home page',
                buttonColor: AppPallete.focusBorderColor,
                onPressed: () {
                  context.push(routeName);
                }),
          ],
        ),
      ),
    );
  }
}
