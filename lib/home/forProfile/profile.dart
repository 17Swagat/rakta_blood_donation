// WORKING

// CONSIDERING THE FACT THAT EVERY PERSON ON THE APP HAS A UNIQUE EMAIL

// import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
// import 'package:loginuicolors/getUserinfo.dart';
// import 'package:loginuicolors/navbar.dart';
import 'dart:async';

/*
Global Variables for Firebase code to get the user data and display
*/
// Name
// Blood Group
// Gender
// Age
// Email

// final userRef = FirebaseFirestore.instance.collection('page_userInfo');
String name = "Loading...";
String bloodgroup = "Loading...";
num age = 0;
String email = "Loading...";
String gender = "Loading...";

class Exp_ProfilePage extends StatefulWidget {
  const Exp_ProfilePage({Key? key}) : super(key: key);

  @override
  State<Exp_ProfilePage> createState() => _Exp_ProfilePageState();
}

class _Exp_ProfilePageState extends State<Exp_ProfilePage> {

  getUserData() async {
    // FirebaseAuth
    String? currentUserEmail = await FirebaseAuth.instance.currentUser!.email;

    // Firestore
    // await 
    FirebaseFirestore.instance
        // .collection('page_userInfo')
        .collection('Register')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              if (document['Email'] ==
                  (FirebaseAuth.instance.currentUser!.email)) {
                name = document['Name'];
                bloodgroup = document['Blood Group'];
                age = num.parse(document['Age']); //document['Age'];
                email = document['Email'];
                gender = document['Gender'];
              }
            }));
  }

 @override
  void initState() {
    // getUserById();
    getUserData();
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    // getUserById();

    // FirebaseAuth.instance.

    setState(() {});
    getUserData();
    setState(() {});

    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Silver appbar
              SliverAppBar(
                backgroundColor:
                    Colors.red, //Color.fromARGB(255, 228, 63, 118),
                // leading: Icon(Icons.menu),
                // title: Text('BLOOD REQUESTS'),
                expandedHeight: 150,
                floating: true,
                // shape: CircleBorder(),
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    color: Colors
                        .redAccent, // Colors.deepPurple,,//Color.fromARGB(255, 228, 63, 118),
                    // child: ,
                  ),
                  // title: Text('B L O O D  -  R E Q U E S T S'),
                  title: Text('P R O F I L E'),
                  centerTitle: true,
                ),
              ),

              //isliver items
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 120,
                      color: Colors.redAccent, //Colors.deepPurple[300],
                      child: Center(
                          child: Text(
                        'NAME: $name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20, //30,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 120,
                      color: Colors.redAccent, //Colors.deepPurple[300],
                      child: Center(
                          child: Text(
                        'BLOOD GROUP: $bloodgroup',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 120,
                      color: Colors.redAccent, //Colors.deepPurple[300],
                      child: Center(
                          child: Text(
                        'GENDER: $gender',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      height: 120,
                      color: Colors.redAccent, //Colors.deepPurple[300],
                      child: Center(
                          child: Text(
                        'AGE: $age',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // );
          // },
        ));
  }
}
