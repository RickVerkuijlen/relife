import 'package:flutter/material.dart';
import 'package:am_awareness/components/voucher.dart';
import 'package:am_awareness/fragments/shop_fragment.dart';
import 'package:am_awareness/main_bottom_class.dart';

class BoughtFragment extends StatefulWidget {
  final List<Voucher> bought;
  const BoughtFragment({Key? key, required this.bought}) : super(key: key);
  @override
  _AddFragment createState() => _AddFragment();
}

class _AddFragment extends State<BoughtFragment> {
  @override
  Widget build(BuildContext context) {
    final vouchers = widget.bought;
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 20,
            margin: EdgeInsets.only(top: 8.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.4),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14))),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Offers',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                  decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.8),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14))),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'My vouchers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.45,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
              ),
              itemCount: vouchers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        ),
                      ]),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(vouchers[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: MediaQuery.of(context).size.height / 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(vouchers[index].logo),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                vouchers[index].title,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'images/Relife_valuta.png',
                                      color: Colors.black,
                                    ),
                                    Text(
                                      vouchers[index].cost,
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}