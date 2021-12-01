import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/components/vote.dart';
import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super (key: key);
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
//  final List<Vote> _votes = [Vote("1", "Most green way of traveling", "3", "50", "15 september"), Vote("2", "Most unique way of travelinasdfasdfasdfasg", "6", "60", "15 september")];

  late HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Challenge>>(
        future: httpService.fetchChallenges(),
        builder: (context, AsyncSnapshot<List> snapshot) =>
          snapshot.hasData
              ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => sendToVote(snapshot.data![index].uuid),
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: IntrinsicHeight(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 275,
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15, bottom: 15),
                                      child: Text(snapshot.data![index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.only(
                                            bottom: 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.image),
                                                Text(snapshot.data![index]
                                                    .amountOfPictures
                                                    .toString() +
                                                    " pictures"),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.how_to_vote),
                                                Text(snapshot.data![index]
                                                    .amountOfVotes
                                                    .toString() + " votes",),
                                              ],
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .stretch,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                          color: Colors.pink,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              bottomRight: Radius.circular(
                                                  15))
                                      ),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text("Deadline"),
                                            Text(snapshot.data![index]
                                                .voteDeadline.toString().split('-').first,
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 30)),
                                            Text(snapshot.data![index]
                                                .voteDeadline.toString().split('-')[1] + ' ' + snapshot.data![index]
                                                .voteDeadline.toString().split('-').last,
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 10),),
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
          )
              : Center(
            child: CircularProgressIndicator(),
          ));

  }

  void sendToVote(String id) {
    debugPrint(id);
  }
}