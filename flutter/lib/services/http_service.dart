import 'dart:convert';

import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/components/submission.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {

  static final Map<String, String> HEADER = {
  "Content-Type": "application/json"
  };

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

  Future<void> submitVotes(String challengeUuid, String userId, List<String> votedSubmissions) async {
    Map data = {
      "challengeUuid": challengeUuid,
      "userId": userId,
      "votedSubmissionUuidList": votedSubmissions
    };

    var response = await http.post(
        Uri.http("10.0.2.2:8080", "/vote"),
        headers: HEADER,
        body: jsonEncode(data)
    );
    var body = response.body;
    print(jsonEncode(data));
    print("data: " + body);

  }

  Future<bool> postSubmission(Submission submission, File image) async {
    String imagePath = await _uploadImageToFirebase("${submission.challengeUuid}/${submission.title}.jpg", image);

    submission.image = imagePath;

    var response = await http.post(
      Uri.http("10.0.2.2:80", "/submission/upload/data"),
      headers: HEADER,
      body: jsonEncode(submission)
    );
    var body = response.body;
    return (response.statusCode == 202);
  }

  Future<String> _uploadImageToFirebase(String fileName, File image) async {
    var request = http.MultipartRequest("POST", Uri.http("10.0.2.2:80", "/submission/upload"));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data'
    });
    request.fields['filename'] = fileName;
    request.files.add(http.MultipartFile.fromBytes('file', image.readAsBytesSync()));
    var res = await request.send();

    return res.stream.bytesToString();
  }

}