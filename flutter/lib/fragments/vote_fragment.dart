import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/components/submission.dart';
import 'package:am_awareness/fragments/vote_detail_fragment.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.name)),
        body: FutureBuilder(
            future: httpService.fetchSubmissionByChallenge(widget.uuid),
            builder: (context, AsyncSnapshot<List> snapshot) => snapshot.hasData
                ? GridView.builder(
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
                            setState(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      widgetPhoto: snapshot.data![index],
                                    ),
                                  ));
                            });
                          },
                          child: Stack(children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(snapshot.data![index].image),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                saved.contains(snapshot.data![index].uuid)
                                    ? Icons.check
                                    : null,
                                color: saved.contains(snapshot.data![index].uuid)
                                    ? Colors.green
                                    : null,
                                size: 100,
                              ),
                            )
                          ]));
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
