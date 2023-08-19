import 'dart:convert';

import 'package:api_fetching_flutter/bitcoin_model.dart';
import 'package:http/http.dart' as http;

// get to fetch dog image

Future getDogImage() async {
  try {
    final response =
        await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["message"];
    } else {
      return "Error in getting result";
    }
  } catch (e) {
    return e.toString();
  }
}

// to get bitcoin price data

Future<Bitcoin> getBitcoinPrice() async {
  final response = await http
      .get(Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));
  return Bitcoin.fromJson(jsonDecode(response.body));
}
