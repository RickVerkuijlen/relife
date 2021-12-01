import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VoteFragment extends StatefulWidget {
  const VoteFragment({Key? key, required this.uuid}) : super(key: key);

  final String uuid;

  @override
  _VoteFragmentState createState() => _VoteFragmentState();
}

class _VoteFragmentState extends State<VoteFragment> {

  final myImages = [
    ['images/auto.jpg'],
    ['images/bierfiets.jpg'],
    ['images/e-step.jpg'],
    ['images/fiets.jpg'],
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TestEvent")
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          ...myImages.map(
                (i) => Column(
              mainAxisSize: MainAxisSize.min,
            ),
          ),
        ],
      )
    );
  }
}
