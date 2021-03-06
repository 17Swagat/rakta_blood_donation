import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/notification/notify.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Notifications"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Notify Donate')
              .doc('${FirebaseAuth.instance.currentUser!.email}')
              .collection('Requests')
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
                              "Blood Request from ${snapshot.data!.docs[index]['From']}",
                              style: TextStyle(
                                  fontSize: 20, //40
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 117, 59, 59)),
                            ),
                            ElevatedButton(
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
                                    .doc('${snapshot.data!.docs[index].id}').set({
                                      'Situation': 'Accepted', //
                                    });
                              },
                            ),
                            SizedBox(
                              height: 0.5,
                            ),
                            ElevatedButton(
                              child: Text(
                                  // "Request Blood from ${snapshot.data!.docs[index]['Email']}"),//Name/Email
                                  "Reject"),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('Notify Donate')
                                    .doc(
                                        '${await FirebaseAuth.instance.currentUser!.email}')
                                    .collection('Requests')
                                    .doc(
                                        '${snapshot.data!.docs[index]['From']}')
                                    .delete();
                              },
                            )
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
