import 'package:intl/intl.dart';

class Challenge {
  final String uuid;
  final String name;
  final String submitDeadline;
  final String voteDeadline;
  final String? currentDeadline;
  final int amountOfPictures;
  final int amountOfVotes;

  Challenge({
    required this.uuid,
    required this.name,
    required this.submitDeadline,
    required this.voteDeadline,
    this.currentDeadline,
    required this.amountOfPictures,
    required this.amountOfVotes
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    DateTime submitDeadline = DateTime.fromMillisecondsSinceEpoch(json['submitDeadline']);
    String formattedDate = DateFormat('dd-MMMM-yyyy').format(submitDeadline);
    return Challenge(
        uuid: json['uuid'],
        name: json['name'],
        submitDeadline: formattedDate,
        voteDeadline: formattedDate,
        amountOfPictures: json['amountOfPictures'],
        amountOfVotes: json['amountOfVotes']
    );
  }
}