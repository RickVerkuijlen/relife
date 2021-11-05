import 'package:am_awareness/components/vote.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super (key: key);
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  List<Vote> _votes = [Vote("Mijn ding", "2")];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              Text(_votes[index].title),
              Text(_votes[index].numberOfVotes)
            ],
          )
        );
      },
      itemCount: _votes.length,
    );
  }
}