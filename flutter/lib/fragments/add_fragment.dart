import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/material.dart';

class AddFragment extends StatefulWidget {
  const AddFragment({Key? key}) : super(key: key);
  @override
  _AddFragment createState() => _AddFragment();
}

class _AddFragment extends State<AddFragment> {
  late HttpService httpService = HttpService();
  late Future<List<Challenge>> futureChallenges;
  late Challenge? dropdownValue = null;

  @override
  void initState() {
    super.initState();
    futureChallenges = httpService.fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              width: 375,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  border: Border.all(color: Colors.black)),
              padding: const EdgeInsets.all(5),
              child: DropdownButtonHideUnderline(
                  child: FutureBuilder<List<Challenge>>(
                      future: futureChallenges,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container();
                        } else if (snapshot.hasData) {
                          // ignore: unnecessary_null_comparison
                          dropdownValue = (dropdownValue != null)
                              ? dropdownValue
                              : snapshot.data![0];
                          return DropdownButton<Challenge>(
                            isExpanded: true,
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (Challenge? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: snapshot.data
                                ?.map<DropdownMenuItem<Challenge>>(
                                    (Challenge value) {
                              debugPrint(value.uuid);
                              return DropdownMenuItem<Challenge>(
                                value: value,
                                child: SizedBox(
                                  child: Text(value.name),
                                ),
                              );
                            }).toList(),
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      })),
            )
          ],
        ),
      )
    ]));
  }
}
