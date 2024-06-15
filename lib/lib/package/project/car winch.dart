import 'package:flutter/material.dart';
import 'package:test1/lib/package/project/account.dart';
import 'package:test1/lib/package/project/chat.dart';
import 'package:test1/lib/package/project/homebage.dart';

class carwinch extends StatefulWidget {
  final data;
  const carwinch({super.key, this.data});
static const String routeName="carwinch";
  @override
  State<carwinch> createState() => _carwinchState();
}

class _carwinchState extends State<carwinch> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (val) {
            setState(() {
              selectedindex = val;
            });
          },
          iconSize: 40,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: InkWell(onTap:(){
                Navigator.pushNamed(context, homebage.routeName);
              },child: Icon(Icons.home_outlined)), label: "Home",),
            BottomNavigationBarItem(icon: InkWell(onTap: () {
              Navigator.pushNamed(context, chat.routeName);
            },child: Icon(Icons.chat)), label: "Chat"),
            BottomNavigationBarItem(
                icon: InkWell(onTap: (){
                  Navigator.pushNamed(context, account.routeName);

                },child: Icon(Icons.person_2_outlined)), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "more"),
          ]),
      endDrawer: Drawer(),
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.car_repair_outlined),
            Text(
              "Taf",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "wila",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.grey[200],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(children: [
          Image.asset("images/13.jpg"),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Car winch",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              )),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "24 Hour Winch Service",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )),
          Container(
              margin: EdgeInsets.only(top: 10, bottom: 15),
              child: Text(
                "Quick Rescue",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
          Container(
              margin: EdgeInsets.only(top: 15, bottom: 20),
              child: Text(
                "All Loads",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: MaterialButton(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Colors.orange,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed("map");
              },
              child: Text("Order Now"),
            ),
          ),
        ]),
      ),
    );
  }
}
