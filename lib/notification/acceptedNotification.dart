import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AcceptedNotifcations extends StatefulWidget {
  const AcceptedNotifcations({ Key? key }) : super(key: key);

  @override
  State<AcceptedNotifcations> createState() => _AcceptedNotifcationsState();
}

class _AcceptedNotifcationsState extends State<AcceptedNotifcations> {
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accepted Blood Requests"),
        backgroundColor: Colors.redAccent,
      ),      
      body: Container(),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Accepted Blood Requests"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('BloodRequestAccepted')
              .doc('${FirebaseAuth.instance.currentUser!.email}')
              .collection('Accepted People')
              .snapshots(),
          // stream: FirebaseFirestore.instance.collection('Notify Donate').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 30, //300,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            border: Border.all(
                                color: Color.fromARGB(255, 237, 135, 135),
                                width: 5),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(
                              "You accepted Blood Request from:  ${snapshot.data!.docs[index].id}",
                              style: TextStyle(
                                  fontSize: 20, //40
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 117, 59, 59)),
                            ),
                            /*ElevatedButton(
                              child: Text(
                                  // "Request Blood from ${snapshot.data!.docs[index]['Email']}"),//Name/Email
                                  "Accept"),
                              onPressed: () async {
                                /*
                                We will create a new collection for this, where we will keep the record of the accepted blood requests
                                */

                                await FirebaseFirestore.instance
                                    .collection('BloodRequestAccepted')
                                    .doc(
                                        '${await FirebaseAuth.instance.currentUser!.email}')
                                    .collection('Accepted People')
                                    .doc('${snapshot.data!.docs[index]}').set({
                                      'Situation': 'Accepted', //
                                    });
                              },
                            ),*/
                            // SizedBox(
                            //   height: 0.5,
                            // ),
                            // ElevatedButton(
                            //   child: Text(
                            //       // "Request Blood from ${snapshot.data!.docs[index]['Email']}"),//Name/Email
                            //       "Reject"),
                            //   onPressed: () async {
                            //     await FirebaseFirestore.instance
                            //         .collection('Notify Donate')
                            //         .doc(
                            //             '${await FirebaseAuth.instance.currentUser!.email}')
                            //         .collection('Requests')
                            //         .doc(
                            //             '${snapshot.data!.docs[index]['From']}')
                            //         .delete();
                            //   },
                            // )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}

  // await FirebaseFirestore.instance
  //     .collection('BloodRequestAccepted')
  //     .doc(
  //         '${await FirebaseAuth.instance.currentUser!.email}')
  //     .collection('Accepted People')
  //     .doc('${snapshot.data!.docs[index]}').set({
  //       'Situation': 'Accepted', //
  //     });

