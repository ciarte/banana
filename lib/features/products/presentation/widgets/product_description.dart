import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
    required this.title,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
                title: Text(title),
                content: Text(description),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ]);
          },
        );
      },
      child: Container(
        height: 120,
        constraints: const BoxConstraints(
          maxHeight: 120,
        ),
        child: description.length > 105
            ? Text.rich(
                maxLines: 4,
                TextSpan(children: [
                  TextSpan(
                    text: description.substring(0, 105),
                    style: const TextStyle(fontSize: 18),
                  ),
                  const TextSpan(text: '...read more')
                ]))
            : Text(description),
      ),
    );
  }
}
