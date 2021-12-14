import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/components/vote.dart';

import 'package:am_awareness/fragments/vote_fragment.dart';
import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({Key? key}) : super(key: key);
  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Challenge>>(
        future: httpService.fetchChallenges(),
        builder: (context, AsyncSnapshot<List> snapshot) => snapshot.hasData
            ? ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => sendToVote(snapshot.data![index].uuid, snapshot.data![index].name),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: IntrinsicHeight(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.65,
                                      padding: const EdgeInsets.only(
                                          top: 15, left: 15, bottom: 15),
                                      child: Text(
                                        snapshot.data![index].name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
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
                                                Text(
                                                  snapshot.data![index]
                                                          .amountOfVotes
                                                          .toString() +
                                                      " votes",
                                                ),
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.all(15),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        decoration: const BoxDecoration(
                                            color: Colors.pink,
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(15),
                                                bottomRight:
                                                    Radius.circular(15))),
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Deadline",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                    snapshot.data![index]
                                                        .voteDeadline
                                                        .toString()
                                                        .split('-')
                                                        .first,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 35)),
                                                Text(
                                                  snapshot.data![index]
                                                          .voteDeadline
                                                          .toString()
                                                          .split('-')[1] +
                                                      ' ' +
                                                      snapshot.data![index]
                                                          .voteDeadline
                                                          .toString()
                                                          .split('-')
                                                          .last,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ]),
                                        ))
                                  ],
                                ),
                              ]))));
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }

  void sendToVote(String id, String name) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VoteFragment(uuid: id, name: name)));
  }
}
