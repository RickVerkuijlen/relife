import 'dart:convert';

import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/components/submission.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class HttpService {
  Future<List<Challenge>> fetchChallenges() async {
    var response = await http.get(Uri.http("10.0.2.2:80", "/challenge"));

    var responseJson = jsonDecode(response.body);

    List<Challenge> result = (responseJson as List).map((m) => Challenge.fromJson(m)).toList();

    result.sort((a, b) => a.submitDeadline.compareTo(b.submitDeadline));

    return result;
  }
  
  Future<List<Submission>> fetchSubmissionByChallenge(String challengeUuid) async {
    var response = await http.get(Uri.http("10.0.2.2:80", "/submission/" + challengeUuid));
    
    var responseJson = jsonDecode(response.body);
    
    List<Submission> result = (responseJson as List).map((e) => Submission.fromJson(e)).toList();

    return result;
  }

  Future<void> submitVotes(String challengeUuid, int userId, List<String> votedSubmissions) async {
    Map data = {
      "challengeUuid": challengeUuid,
      "userId": userId,
      "votedSubmissionUuidList": votedSubmissions
    };

    Map<String, String> header = {
      "Content-Type": "application/json"
    };

    var response = await http.post(
        Uri.http("10.0.2.2:80", "/vote"),
        headers: header,
        body: jsonEncode(data)
    );
    var body = response.body;
    print(jsonEncode(data));
    print("data: " + body);

  }

}