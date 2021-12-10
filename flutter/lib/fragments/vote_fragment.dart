import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:am_awareness/components/submission.dart';
import 'package:am_awareness/fragments/vote_detail_fragment.dart';

final saved = <Photo>{};

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
    final percentagePhoto = _photos.length / 10;
    final canSubmit = saved.length == percentagePhoto.round();
    final amountOfVotes = percentagePhoto.round();

    return GestureDetector(
      onTap: (){
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(title: Text(widget.name)),
        body: FutureBuilder(
            future: httpService.fetchSubmissionByChallenge(widget.uuid),
            builder: (context, AsyncSnapshot<List> snapshot) => snapshot.hasData
        ? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: 4,
          ),
          itemCount: _photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            widgetPhoto: _photos[index],
                          ),
                        ));
                  debugPrint(amountOfVotes.toString());
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
                      saved.contains(_photos[index]) ? Icons.check : null,
                      color: saved.contains(_photos[index])
                          ? Colors.green
                          : null,
                    ),
                  )
                ]));
          },
        ),
        : const Center(
                    child: CircularProgressIndicator(),
                  )));
        floatingActionButton:
             Container(
               foregroundDecoration: canSubmit ? null:  BoxDecoration(
                 color: Colors.white,
                 backgroundBlendMode: BlendMode.saturation,
               ),
               child: FloatingActionButton.extended(
                  backgroundColor: Colors.pink ,
                  onPressed:canSubmit ? (){
                    saved.toString();
                    debugPrint(saved.toString());
                  } : () {},
                  icon: const Icon(Icons.send),
                  label: const Text('Submit'),
                ),
             ),
      ),
    );
  }
}
