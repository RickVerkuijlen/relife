import 'package:am_awareness/components/submission.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/fragments/vote_fragment.dart';

class DetailPage extends StatefulWidget {
  final Submission widgetPhoto;

  const DetailPage({
    Key? key,
    required this.widgetPhoto,
  }) : super(key: key);

  @override
  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final Submission photo = widget.widgetPhoto;
    final alreadySaved = saved.contains(photo.uuid);
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                if (alreadySaved) {
                  saved.remove(photo.uuid);
                } else {
                  saved.add(photo.uuid);
                }
                debugPrint(saved.toString());
              });
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image(
                fit: BoxFit.fitWidth,
                image: NetworkImage(photo.image),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.pink.withOpacity(0.5),
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  photo.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  photo.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Icon(
                  alreadySaved ? Icons.favorite : Icons.favorite_border,
                  color: alreadySaved ? Colors.red : null,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
