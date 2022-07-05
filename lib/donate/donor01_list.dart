import 'package:flutter/material.dart';

class Donor01_List extends StatefulWidget {
  const Donor01_List({Key? key}) : super(key: key);

  @override
  State<Donor01_List> createState() => _Donor01_ListState();
}

class _Donor01_ListState extends State<Donor01_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,

              children: [
                // InkWell(
                //   onTap: () {
                //     print("fuck A+");
                //   },
                //   child: Container(
                //     color: Colors.grey.shade300,
                //     child: Center(
                //       child: Container(
                //         height: 50,
                //         width: 150,
                //         decoration: BoxDecoration(
                //             color: Colors.grey.shade300,
                //             borderRadius: BorderRadius.circular(15),
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.purple,
                //                 spreadRadius: 1,
                //                 blurRadius: 8,
                //                 offset: Offset(5, 5),
                //               ),
                //               BoxShadow(
                //                 color: Colors.white,
                //                 spreadRadius: 2,
                //                 blurRadius: 8,
                //                 offset: Offset(-4, -4),
                //               )
                //             ]),
                //         child: Center(
                //           child: Text(
                //             "A++",
                //             style: TextStyle(
                //               color: Colors.purple,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 18,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("A+"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("A-")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("B+")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("B-")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("O+")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("O-")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("AB+")),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () {}, child: Text("AB-")),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
