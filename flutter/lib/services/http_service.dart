import 'dart:convert';

import 'package:am_awareness/components/challenge.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<List<Challenge>> fetchChallenges() async {
    var response = await http.get(Uri.http("10.0.2.2:80", "/challenge"));

    var responseJson = jsonDecode(response.body);

    List<Challenge> result = (responseJson as List).map((m) => Challenge.fromJson(m)).toList();

    result.sort((a, b) => a.submitDeadline.compareTo(b.submitDeadline));

    return result;
  }
}