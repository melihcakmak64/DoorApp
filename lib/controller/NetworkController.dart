import 'dart:convert';
import 'package:door_demo/model/Quote.dart';
import 'package:http/http.dart' as http;
import "dart:math";

class NetworkController {
  Future<Quote> fetchQuote(String emotionKeyword) async {
    final _random = new Random();
    final String apiKey = "53220287dbd97af8e667979596606497";
    final String apiUrl =
        "https://favqs.com/api/quotes/?filter=$emotionKeyword";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Token token=$apiKey',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      // Handle the data as needed
      var quotes = data["quotes"];
      var quote = quotes[_random.nextInt(quotes.length)];

      return Quote(
          author: quote["author"] ?? "Oopps there is no quote for you",
          body: quote["body"] ?? "");
    } else {
      // Handle error
      print("Error: ${response.statusCode}");
      return Quote(author: "", body: "Ooops there is an error");
    }
  }
}
