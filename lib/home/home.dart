// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),

//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rakta_blood_donation/donate/mainDonatePage.dart';
// import 'package:loginuicolors/experimental/exp_profilePage.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/donor/mainDonatePage.dart';
// import 'package:loginuicolors/mainCodeFiles/homeStuff/requesters/mainRequesterPage.dart';
// import 'package:loginuicolors/mapSample.dart';
// import 'package:loginuicolors/navbar.dart';
// import 'NavBar.dart';
// import 'package:loginuicolors/navbar.dart';
// import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Custom Functions

  //1. custom card function
  Card makeDashBoardItems(String title, String img, int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: const LinearGradient(
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(3.0, -1.0),
              colors: [
                // Color.fromARGB(255, 225, 79, 123),
                Colors.redAccent,
                Color(0xFFFFFFFF),
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 3,
                offset: Offset(2, 2),
              )
            ]),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              //1. PROFILE
              // Navigator.pushNamed(context, "/profile");
              Navigator.pushNamed(context, "/profile");
            }

            if (index == 1) {
              //2. Notification
              // Navigator.pushNamed(
              //     context, '/notificationList');
              Navigator.pushNamed(context, "/notificationMain");
            }

            if (index == 2) {
              //3. Donate Blood

              //activating function on `Donate Blood` click
              // donateBloodFunc_popupDialog();
              show_bloodDonateConfimationDialog(context);
            }
            if (index == 3) {
              //4. Request Blood
              // Navigator.pushNamed(context, "/exp_bloodRequest");
              show_bloodRequestConfimationDialog(context);
            }
            if (index == 4) {
              //5. All Requests :-> Currently making it inactive
              Navigator.pushNamed(context, "/allRequestsPage");
            }
            if (index == 5) {
              //6. Logout
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Image.asset(
                  img,
                  height: 40,
                  width: 40,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //2. blood donation popup dialog
  donateBloodFunc_popupDialog() {
    showDialog(
        // barrierColor: Color.fromARGB(255, 244, 174, 153),
        context: context,
        builder: (context) {
          return Dialog(
            // insetPadding: EdgeInsets.all(4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              // side: BorderSide(width: 40)
            ),
            elevation: 16,
            child: Container(
              // margin: EdgeInsets.only(
              //   left: 20,
              // ),
              // top: MediaQuery.of(context).size.height * 0.5),
              color: Color.fromARGB(
                  255, 244, 174, 153), //Color.fromARGB(255, 244, 78, 44),
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  // SizedBox(height: 20),
                  Center(
                      child: Text(
                    'Do you really want to Donate Blood?',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                  SizedBox(height: 20),
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 2, 37, 52),
                    radius: 30,
                    child: IconButton(
                        onPressed: () {
                          print('hello');
                        },
                        icon: Icon(Icons.arrow_forward_ios)),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        });
  }

  // #3. Comes up when the user wants to donate blood
  show_bloodDonateConfimationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        Navigator.pop(context);
        // Navigator.pushNamed(context, "/donateBloodMap");
        // **************************8
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DonatePage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you really want to donate blood?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  // #4. Comes up when the user wants to request for blood
  show_bloodRequestConfimationDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () async {
        // THIS WILL MOVE US TO THE MAP and show us the current location of the map

        Navigator.pop(context);
        // Navigator.pushNamed(context, "/requestBloodMap");
        // *************************************************
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => const RequestersPage()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you really want to request for blood?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.deepPurple[100],
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Rakta"),
      //   backgroundColor: Colors.redAccent,
      // ),

      backgroundColor:
          Colors.deepPurple[100], //Color.fromARGB(255, 255, 255, 255),

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RAKTA",
          style: TextStyle(fontFamily: 'RobotoMono'),
        ),
        // backgroundColor: Color.fromARGB(213, 242, 11, 11),
        backgroundColor: Colors.redAccent,
        actions: [
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MapSample()));
                  },
                  icon: Icon(Icons.search)),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ))
            ],
          )
        ],
      ),

      // drawer: NavBar(),

      //not sure whether we will use this or not.
      // drawer: Drawer(),

      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(2),
            children: [
              //index 0
              // SizedBox(height: .5,),
              makeDashBoardItems(
                  // "Calender", "assets/thirdParty/calendar.png", 0),
                  "Profile",
                  "assets/images/profile_logImg128.png",
                  0),
              //index 1
              makeDashBoardItems(
                  // "Festival", "assets/thirdParty/festival.png", 1),
                  // "assets/thirdParty/map.png",
                  "Notifications",
                  "assets/thirdParty/notification.png",
                  1),
              //index 2
              // SizedBox(height: 5,),
              makeDashBoardItems(
                  "Donate Blood", "assets/images/blood_donateLogo128.png", 2),
              //index 3
              makeDashBoardItems("Request Blood",
                  "assets/images/blood_requestImg2_128.png", 3),
              //index 4
              //NOT sure what logo should we put
              makeDashBoardItems(
                  "All Requests", "assets/thirdParty/todo.png", 4),
              //index 5
              makeDashBoardItems(
                  "Logout", "assets/images/logoutLogo128.png", 5),
            ],
          ))
        ],
      ),
    );
  }
}

Widget _buildRow(String imageAsset, String name, double score) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
      children: <Widget>[
        SizedBox(height: 12),
        Container(height: 2, color: Colors.redAccent),
        SizedBox(height: 12),
        Row(
          children: <Widget>[
            CircleAvatar(backgroundImage: AssetImage(imageAsset)),
            SizedBox(width: 12),
            Text(name),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[900],
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Text('$score'),
            ),
          ],
        ),
      ],
    ),
  );
}
