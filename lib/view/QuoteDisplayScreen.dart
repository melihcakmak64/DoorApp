import 'package:door_demo/model/Quote.dart';
import 'package:flutter/material.dart';

class QuoteDisplayScreen extends StatelessWidget {
  final Quote quote;
  const QuoteDisplayScreen({required this.quote, super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage(
                    "assets/background.png",
                  ),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '"${quote.body}"',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  quote.author,
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.red, fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
