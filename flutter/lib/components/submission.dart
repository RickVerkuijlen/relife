import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Submission{
  final String challengeUuid;
  final String? userId;
  final String? uuid;
  String? image;
  final String title;
  final String description;
  final String location;
  final String tags;
  final int amountOfLikes;
  final String date;


  Submission({
    required this.challengeUuid, this.userId, this.uuid, this.image, required this.title, required this.description, required this.location, required this.amountOfLikes, required this.date, required this.tags
});

  factory Submission.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.parse(json['date']);
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(date);
    String tags = "Hoi, asdf";
    return Submission(
        challengeUuid: json['challengeUuid'],
        userId: json['userId'],
        uuid: json['submissionUuid'],
        title: json['name'],
        description: json['description'],
        location: json['location'],
        image: json['imageUrl'],
        date: formattedDate,
        tags: tags,
        amountOfLikes: json['amountOfLikes']
    );
  }

  Map<String, dynamic> toJson() => {
    'challengeUuid': challengeUuid,
    'userId': userId,
    'submissionUuid': uuid,
    'name': title,
    'description': description,
    'location': location,
    'imageUrl': image,
    'date': date,
    'tags': tags,
    'amountOfLikes': amountOfLikes
  };
}