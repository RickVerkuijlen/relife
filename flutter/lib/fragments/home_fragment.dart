import 'package:am_awareness/components/vote.dart';
import 'package:am_awareness/fragments/vote_fragment.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super (key: key);
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final List<Vote> _votes = [Vote("1", "Most green way of traveling", "3", "50", "15 september"), Vote("2", "Most unique way of travelinasdfasdfasdfasg", "6", "60", "15 september")];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _votes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => sendToVote(_votes[index].id),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            width: 275,
                            padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
                            child: Text(_votes[index].title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.image),
                                    Text(_votes[index].numberOfPictures + " pictures"),
                                  ],
                                ),
                                Row(
                                    children: [
                                      Icon(Icons.how_to_vote),
                                      Text(_votes[index].numberOfVotes + " votes",),
                                    ],
                                  )
                              ],
                            )
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(15),
                              decoration: const BoxDecoration(
                                color: Colors.pink,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15))
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Deadline"),
                                    Text(_votes[index].deadline, style: TextStyle(color: Colors.white), )
                                  ]
                              ),
                            )
                        ],
                      ),
                    ]
                )
            )
          )
        );
      },
    );
  }

  void sendToVote(String id) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VoteFragment(uuid: "asdf")
        ));
  }
}