import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rakta_blood_donation/donate/donor01_list.dart';
import 'package:rakta_blood_donation/home/allrequest.dart';
import 'package:rakta_blood_donation/home/forProfile/profile.dart';
import 'package:rakta_blood_donation/home/forProfile/profile2.dart';
import 'package:rakta_blood_donation/notification/acceptedNotification.dart';
import 'package:rakta_blood_donation/notification/notificationMain.dart';
import 'package:rakta_blood_donation/notification/notification_list.dart';
import 'home/home.dart';
import 'loginAndSignup/login.dart';
import 'loginAndSignup/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RAKTA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: '/',//'/donor01_list',
      routes: {
        '/':(context) => LoginPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home':(context) => HomePage(),
        '/profile': (context) => Exp_ProfilePage(),
        '/profile2': (context) => Profile2_screen(),
        '/allRequestsPage': (context) => AllRequestsPage(),
        '/notificationMain': (context) => NotificationMain(),
        '/notificationList': (context) => NotificationList(),
        '/notificationAccepted': (context) => AcceptedNotifcations(),

        '/donor01_list': (context) => Donor01_List(),
      },
    );
  }
}
