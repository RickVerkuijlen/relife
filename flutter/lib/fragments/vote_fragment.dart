import 'dart:ui';
import 'package:am_awareness/fragments/home_fragment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/components/photo.dart';


class VoteFragment extends StatefulWidget {
  const VoteFragment({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  _VoteFragmentState createState() => _VoteFragmentState();
}

class _VoteFragmentState extends State<VoteFragment> {
  final List<Photo> _photos = [
    Photo(
        'images/auto.jpg',
        'Auto',
        'Een simpele auto, c1 rood',
        'rood, verbrandingsmotor, auto',
        'Arnhem'
    ),
    Photo(
        'images/bierfiets.jpg',
        'Bierfiets',
        'Een fiets voor vrienden, terwijl je bier drinkt',
        'Fiets, bier, alcohol',
        'Nijmegen'
    ),
    Photo(
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'
    )
  ];

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Test Event')),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
              crossAxisCount: 4,
            ),
            itemCount: _photos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                        image: _photos[index].image,
                        title: _photos[index].title,
                        description: _photos[index].description,
                        tags: _photos[index].tags,
                        location: _photos[index].location
                      ),
                  ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_photos[index].image),
                    ),
                  ),
                ),
              );
            },
        ),
    );
  }
}
class DetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String tags;
  final String location;
  const DetailPage({Key? key,
    required this.image, required this.title, required this.description, required this.location, required this.tags })
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
                style: TextStyle(fontSize: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

