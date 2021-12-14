import 'dart:io';

import 'package:am_awareness/components/challenge.dart';
import 'package:am_awareness/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddFragment extends StatefulWidget {
  const AddFragment({Key? key}) : super(key: key);
  @override
  _AddFragment createState() => _AddFragment();
}

class _AddFragment extends State<AddFragment> {
  late HttpService httpService = HttpService();
  late Future<List<Challenge>> futureChallenges;
  Challenge? dropdownValue = null;
  File? image;

  @override
  void initState() {
    super.initState();
    futureChallenges = httpService.fetchChallenges();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.pink,
            ),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 5, bottom: 15, top: 5),
                    child: Text("Choose you challenge",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))),
                Container(
                  width: MediaQuery.of(context).size.width * 0.895,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  padding: const EdgeInsets.all(5.0),
                  child: DropdownButtonHideUnderline(
                      child: FutureBuilder<List<Challenge>>(
                          future: futureChallenges,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Container();
                            } else if (snapshot.hasData) {
                              dropdownValue = (dropdownValue != null)
                                  ? dropdownValue
                                  : null;
                              return DropdownButton<Challenge>(
                                isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(color: Colors.black),
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
                                hint: (dropdownValue == null) ? Text("Select challenge", style: TextStyle(color: Colors.grey[600]), textAlign: TextAlign.center,) : null
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          })),
                ),
                (dropdownValue != null)
                    ? Padding(
                        padding:
                            const EdgeInsets.only(left: 5, top: 15, bottom: 5),
                        child: Row(
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(left: 10, right: 5),
                                child: Icon(
                                  Icons.timelapse,
                                  color: Colors.white,
                                )),
                            Text(
                              dropdownValue!.submitDeadline,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(left: 10, right: 5),
                                child: Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                )),
                            Text("${dropdownValue!.amountOfPictures} pictures",
                                style: const TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
          (dropdownValue != null) ?
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: () => pickImage(),
                        child: (image != null)
                            ? Container(
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 4,
                                child: Stack(
                                  fit: StackFit.passthrough,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        child: Image.file(
                                          image!,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Icon(
                                      Icons.edit,
                                      size: 60,
                                      color: Colors.grey.withOpacity(0.75),
                                    ),
                                  )
                                ]))
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                height: MediaQuery.of(context).size.height / 7,
                                width: MediaQuery.of(context).size.width / 4,
                                padding: const EdgeInsets.all(20),
                                child: Icon(Icons.camera_alt,
                                    size: 60, color: Colors.grey[500]),
                              )),
                    Row(
                      children: [
                        Column(
                          children: [Text("Title"), Text("Description")],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [Text("Tags")],
                ),
                Row(
                  children: [Text("Location")],
                ),
              ],
            ),
          ) : Container(child: Text("Select a challenge first!"),)
        ]));
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
