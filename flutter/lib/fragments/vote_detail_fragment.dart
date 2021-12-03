import 'package:flutter/material.dart';
import 'package:am_awareness/fragments/vote_fragment.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String tags;
  final String location;
  const DetailPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.location,
      required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              width: double.infinity,
              child: Image(
                image: AssetImage(image),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 28,
                fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
