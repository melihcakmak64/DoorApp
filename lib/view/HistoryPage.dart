import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final Map<dynamic, String> historyItems;
  const HistoryPage({super.key, required this.historyItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "History Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [myContainer("Date"), myContainer("Emotion")],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: historyItems.keys.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myContainer(historyItems.keys.elementAt(index)),
                      myContainer(
                          historyItems[historyItems.keys.elementAt(index)]!)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}

Widget myContainer(String text) {
  return Container(
    alignment: Alignment.center,
    height: 100,
    width: 200,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20,
      ),
    ),
  );
}
