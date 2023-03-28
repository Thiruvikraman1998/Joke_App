import 'package:flutter/material.dart';
import 'package:jokeapp/main.dart';
import 'class.dart';

class Test extends StatelessWidget {
  final String title;
  final Joke joke;
  const Test({super.key, required this.title, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Joke of the Day",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Text(joke.setup!),
            Text(joke.punchline!),
          ],
        )
      ],
    );
  }
}
