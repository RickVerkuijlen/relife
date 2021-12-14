import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Submission{
  final String uuid;
  final String image;
  final String title;
  final String description;
  final String location;
  final String tags;
  final int amountOfLikes;
  final String date;


  Submission({
    required this.uuid, required this.image, required this.title, required this.description, required this.location, required this.amountOfLikes, required this.date, required this.tags
});

  factory Submission.fromJson(Map<String, dynamic> json) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(json['date']);
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(date);
    String tags = "Hoi, asdf";
    return Submission(
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
}