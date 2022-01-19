
import 'package:flutter/material.dart';

class AccountFragment extends StatefulWidget {
  const AccountFragment({Key? key}) : super (key: key);
  @override
  _AccountFragment createState() => _AccountFragment();
}
class _AccountFragment extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
             // height: MediaQuery.of(context).size.height/2,
             // width: 400,
              child: Column(  children: [
                const SizedBox(height: 15),
                Container(  //Profile Information Box
                  width: 390,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    border: Border.all(
                      width: 2.0,
                      style: BorderStyle.solid,
                      color: Colors.pink,
                    ),
                  boxShadow: [BoxShadow(
                    color: Colors.pink.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0,2),
                  )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  ),
                  child: Row(
                      children: [
                        Stack( children: [
                          Container(      // ProfilePicture Placeholder
                            margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(
                                width: 3.0,
                                style: BorderStyle.solid,
                                color: Colors.white,
                                ),
                              boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                              ),
                              ],
                              ),
                            ),
                          Container(  // Edit Profile pic icon placeholder
                            padding: const EdgeInsets.only(top: 120, left: 125),
                            child: CircleAvatar(
                              backgroundColor: Colors.black54,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                        ),
                        const SizedBox(width: 20), // give it width
                        Container(
                           // height: MediaQuery.of(context).size.height/3,
                           // width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(height: 10), // set height
                                const Text('Name:', style: TextStyle(fontSize: 11,color: Colors.white)),
                                const Text('  Anonymous', style: TextStyle(fontSize: 15,color: Colors.white)),
                                Container(height: 10), // set height
                                const Text('Student Number:', style: TextStyle(fontSize: 11,color: Colors.white)),
                                const Text('  000000', style: TextStyle(fontSize: 15,color: Colors.white)),
                                Container(height: 10), // set height
                                const Text('Educational Institute:', style: TextStyle(fontSize: 11,color: Colors.white)),
                                const Text('  HAN', style: TextStyle(fontSize: 15,color: Colors.white)),

                                const SizedBox(height: 10),
                                Container(
                                  height: 30,
                                  width: 180,
                                  color: Colors.deepOrange,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Center(
                                      child: Text(
                                        "Export Personal Information",
                                        style: TextStyle(
                                          fontSize: 11.5,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        //  PLACEHOLDER USERNAME, etc
                      ],
                  ),
                ),
                const SizedBox(height: 20),
                 Container(           // Statistics Box
                    width: 390,
                    height: 160,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      border: Border.all(
                        width: 2.0,
                        style: BorderStyle.solid,
                        color: Colors.pink,
                      ),
                      boxShadow: [BoxShadow(
                      color: Colors.pink.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0,2),
                      ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Row( children: [
                      Container(
                       // height: MediaQuery.of(context).size.height/3,
                       // width: 400,
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                          Text('Statistics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white)),
                          SizedBox(height: 6),
                          Text('Total ReLife Coins Scored', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('ReLife Coins Spend', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('Most Coins Earned Of 1 Entry', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('Average Coins Earned Per Entry', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('Number Of Entries', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('Number Of Votes Giver', style: TextStyle(fontSize: 14,color: Colors.white)),
                          Text('Average Number Of Votes Per Event', style: TextStyle(fontSize: 14,color: Colors.white)),
                        ],
                        ),
                      )
                    ],
                    ),
                  ),
                const SizedBox(height: 10),
                Container(  //Last Entries
                  margin: const EdgeInsets.symmetric(horizontal: 7,vertical: 7),
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(' Last Entries', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.black)),
                //
                   SizedBox(
                      height: MediaQuery.of(context).size.height/4.7,
                      width: MediaQuery.of(context).size.width,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                            height: 97,
                            width: 97,
                            child: const Image(image:AssetImage('images/e-step.jpg'),
                            fit: BoxFit.fitHeight,),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                            height: 97,
                            width: 97,
                            child: const Image(image:AssetImage('images/fiets.jpg'),
                              fit: BoxFit.fitHeight,),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                            height: 97,
                            width: 97,
                            child: const Image(image:AssetImage('images/scooter.jpg'),
                              fit: BoxFit.fitHeight,),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1,vertical: 1),
                            height: 97,
                            width: 97,
                            child: const Image(image:AssetImage('images/bierfiets.jpg'),
                              fit: BoxFit.fitHeight,),
                          ),
                        ],
                      ),
                   ),
                    ],
                  ),
                ),
                Container(// Game Specification
                    margin: const EdgeInsets.symmetric(horizontal: 12,vertical: 7),
                    height: MediaQuery.of(context).size.height/6,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Game Specifications', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.black)),
                          SizedBox(height: 8),
                          Text('Lorum Ipsum Dolor Sit Amet Consecterur', style: TextStyle(fontSize: 10,color: Colors.black)),
                          Text('Adipiscing Elit Donec Eu Rutrum Nunc.', style: TextStyle(fontSize: 10,color: Colors.black )),
                          Text('Proin A Risus Metus', style: TextStyle(fontSize: 10,color: Colors.black)),
                          Text('Donec NE Commodo Nibh', style: TextStyle(fontSize: 10,color: Colors.black)),
                          Text('Vitea Posuere Nunc.', style: TextStyle(fontSize: 10,color: Colors.black)),
                        ],
                      ),
                    ),

                const SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 160,
                  color: Colors.red,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Center(

                      child: Text(
                        "Delete Account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

