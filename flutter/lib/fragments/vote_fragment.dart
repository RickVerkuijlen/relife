import 'package:am_awareness/fragments/vote_detail_fragment.dart';
import 'package:am_awareness/services/currency_service.dart';
import 'package:am_awareness/services/http_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final saved = <String>{};

class VoteFragment extends StatefulWidget {
  const VoteFragment({Key? key, required this.uuid, required this.name})
      : super(key: key);

  final String uuid;
  final String name;

  @override
  _VoteFragmentState createState() => _VoteFragmentState();
}

class _VoteFragmentState extends State<VoteFragment> {
  late HttpService httpService = HttpService();
  late CurrencyService currencyService = CurrencyService();
  late bool canSubmit = false;
  late int amountOfVotes = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {});
        },
        child: Scaffold(
            appBar: AppBar(title: Text(widget.name)),
            body: FutureBuilder(
                future: httpService.fetchSubmissionByChallenge(widget.uuid),
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    final percentagePhoto = snapshot.data!.length / 2;
                    canSubmit = saved.length ==
                        (percentagePhoto.round() < 1
                            ? 1
                            : percentagePhoto.round());
                    amountOfVotes = percentagePhoto.round();
                    debugPrint("$amountOfVotes");
                    debugPrint("${saved.length}");
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 4,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      widgetPhoto: snapshot.data![index],
                                    ),
                                  ));
                              debugPrint(amountOfVotes.toString());
                            },
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index].image),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  saved.contains(snapshot.data![index].uuid)
                                      ? Icons.check
                                      : null,
                                  color: Colors.green,
                                  size: 100,
                                ),
                              )
                            ]));
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            floatingActionButton: Container(
                foregroundDecoration: canSubmit
                    ? null
                    : const BoxDecoration(
                        color: Colors.white,
                        backgroundBlendMode: BlendMode.saturation,
                      ),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.pink,
                  onPressed: canSubmit
                      ? () {
                          submitVotes(widget.uuid, saved);
                        }
                      : () {},
                  icon: const Icon(Icons.send),
                  label: Text(canSubmit
                      ? "Submit"
                      : '${amountOfVotes - saved.length} votes left'),
                ))));
  }

  void submitVotes(String challengeUuid, Set<String> savedSubmissionUuids) {
    debugPrint("ChallengeUuid: $challengeUuid");
    debugPrint("UserId: ${FirebaseAuth.instance.currentUser!.uid}");
    debugPrint("savedSubmissionUuids: $savedSubmissionUuids");

//    httpService.submitVotes(challengeUuid,
//        FirebaseAuth.instance.currentUser!.uid, savedSubmissionUuids.toList());

    currencyService.addCurrency(100);
    setState(() {

    });
  }
}
