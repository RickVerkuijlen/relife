import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/components/photo.dart';
import 'package:am_awareness/fragments/vote_detail_fragment.dart';

final saved = <String>{};

class VoteFragment extends StatefulWidget {
  const VoteFragment({Key? key, required this.uuid, required this.name}) : super(key: key);

  final String uuid;
  final String name;

  @override
  _VoteFragmentState createState() => _VoteFragmentState();
}

class _VoteFragmentState extends State<VoteFragment> {
  final List<Photo> _photos = [
    Photo('e707db5c-56a8-11ec-bf63-0242ac130002', 'images/auto.jpg', 'Auto',
        'Een simpele auto, c1 rood', 'rood, verbrandingsmotor, auto', 'Arnhem'),
    Photo(
        'e707ddaa-56a8-11ec-bf63-0242ac130002',
        'images/bierfiets.jpg',
        'Bierfiets',
        'Een fiets voor vrienden, terwijl je bier drinkt',
        'Fiets, bier, alcohol',
        'Nijmegen'),
    Photo(
        'e707dec2-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        'e707dfa8-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        'e707e214-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        'e707e304-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        'e707e3d6-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        'e707e4a8-56a8-11ec-bf63-0242ac130002',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        '',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        '',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo(
        '',
        'images/e-step.jpg',
        'e-step',
        'Een step met een electrische motor',
        'step, electrisch, klein',
        'Wychen'),
    Photo('', 'images/auto.jpg', 'Auto', 'Een simpele auto, c1 rood',
        'rood, verbrandingsmotor, auto', 'Arnhem'),
    Photo('', 'images/auto.jpg', 'Auto', 'Een simpele auto, c1 rood',
        'rood, verbrandingsmotor, auto', 'Arnhem'),
    Photo('', 'images/auto.jpg', 'Auto', 'Een simpele auto, c1 rood',
        'rood, verbrandingsmotor, auto', 'Arnhem'),
    Photo('', 'images/auto.jpg', 'Auto', 'Een simpele auto, c1 rood',
        'rood, verbrandingsmotor, auto', 'Arnhem'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 4,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          widgetPhoto: _photos[index],
                        ),
                      ));
                });

              },
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(_photos[index].image),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    saved.contains(_photos[index].uuid) ? Icons.check : null,
                    color: saved.contains(_photos[index].uuid)
                        ? Colors.green
                        : null,
                  ),
                )
              ]));
        },
      ),
    );
  }
}
