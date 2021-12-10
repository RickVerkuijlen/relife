import 'package:am_awareness/components/photo.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/fragments/vote_fragment.dart';

class DetailPage extends StatefulWidget {
  final Photo widgetPhoto;

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
    final Photo photo = widget.widgetPhoto;
    final alreadySaved = saved.contains(photo);
    List<String> tags = photo.tags.split(", ");
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
                  saved.remove(photo);
                } else {
                  saved.add(photo);
                }
                debugPrint(saved.length.toString());
              });
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage(photo.image),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.pink.withOpacity(0.5),
            ),
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          right: 2.0,
                        ),
                        padding: EdgeInsets.only(
                          left: 4.0,
                          right: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Text(
                          tags[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      photo.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (alreadySaved) {
                            saved.remove(photo);
                          } else {
                            saved.add(photo);
                          }
                        });
                      },
                      child: Icon(
                        alreadySaved ? Icons.favorite : Icons.favorite_border,
                        color: alreadySaved ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
                Text(
                  photo.description,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Text(
                  photo.location,
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
