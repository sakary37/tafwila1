import 'package:flutter/material.dart';
import 'package:test1/lib/package/project/account.dart';
import 'package:test1/lib/package/project/chat.dart';
import 'package:test1/lib/package/project/chatbot_screen.dart';
import 'package:test1/lib/package/project/petrol.dart';
import 'Tire Repair .dart';
import 'car winch.dart';
import 'electricity Repair .dart';
import 'package:shared_preferences/shared_preferences.dart';

class homebage extends StatefulWidget {
  const homebage({super.key});
static const String routeName="homebage";
  @override
  State<homebage> createState() => _homebageState();
}

class _homebageState extends State<homebage> {
  int selectedindex = 0;
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.of(context).pushReplacementNamed("login");
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
      if (Navigator.of(context).userGestureInProgress)
        return false;
      else {
        return true;
      }
    },

    child: Scaffold(
       appBar: AppBar(
        title: Row(
          children: [
            Text(
              "           Taf",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            Text(
              "wila",
              style: TextStyle(fontSize: 30, color: Colors.orange),
            )
          ],
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      endDrawer: Drawer(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children:[ SizedBox(height: 40,),

            Row(
              children: [  TextButton(onPressed:_logout , child: Text("Logout" )),
                SizedBox(width: 8,),
                IconButton(
                  onPressed: _logout,
                  icon: Icon(Icons.logout),
                ),

              ],
            ),
            SizedBox(height: 30,),
            Row(
              children: [

                TextButton(onPressed: (){
      Navigator.pushNamed( context, chat.routeName);}, child: Text("Chat" )),
        SizedBox(width: 8,),

                SizedBox(width: 8,),
                IconButton.filled(onPressed: (){
                  Navigator.pushNamed( context, chat.routeName);
                }, icon:Icon(Icons.chat) ),
    ],
            ),SizedBox(height: 30,),
            Row(
              children: [

                TextButton(onPressed: (){
                  Navigator.pushNamed( context, account.routeName);}, child: Text("Account" )),
                SizedBox(width: 8,),
                IconButton.filled(onPressed: (){
                  Navigator.pushNamed( context, account.routeName);
                }, icon:Icon(Icons.account_box_rounded) ),
              ],
            ),


          ]
        ),
      ),
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
              Navigator.pushNamed(context, ChatScreen.routeName);
            },child: Icon(Icons.chat)), label: "Chat"),
            BottomNavigationBarItem(
                icon: InkWell(onTap: (){
                  Navigator.pushNamed(context, account.routeName);

                },child: Icon(Icons.person_2_outlined)), label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: "more"),
          ]),
      // Pages.elementAt(selectedindex),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search",
                    hintStyle: TextStyle(fontSize: 25),
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    border: InputBorder.none,
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                )),
              ],
            ),
            Container(
              height: 30,
            ),
            const Text(
              "categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: InkWell(onTap: () {
                            Navigator.pushNamed(context, carwinch.routeName);
                          },
                            child: const Icon(
                              Icons.car_repair_outlined,
                              size: 40,
                              color: Colors.orange,
                            ),
                          ),
                          padding: EdgeInsets.all(15),
                        ),
                        const Text(
                          "Car winch",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                        child: InkWell(onTap: () {
                          Navigator.pushNamed(context, petrol.routeName);
                        },
                        child: Icon(
                          Icons.local_gas_station,
                          size: 40,
                          color: Colors.orange,
                        ), ),
                        padding: EdgeInsets.all(15),
                      ),
                      Text(
                        "Petrol",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                         child: InkWell(onTap: () {
                           Navigator.pushNamed(context, tirerepair.routeName);
                         },
                        child: Icon(
                          Icons.tire_repair,
                          size: 40,
                          color: Colors.orange,
                        ),),
                        padding: EdgeInsets.all(15),
                      ),
                      Text(
                        "Tire Repair",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(100)),
                         child: InkWell(onTap: () {
                         Navigator.pushNamed(context, electricityRepair.routeName);
                         },
                        child: Icon(
                          Icons.electric_car_sharp,
                          size: 40,
                          color: Colors.orange,
                        ),),
                        padding: EdgeInsets.all(15),
                      ),
                      Text(
                        "Car electricity",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "What do you want ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => carwinch()));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          color: Colors.grey,
                          child: Image.asset(
                            "images/13.jpg",
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Car Winch",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                        ),
                        Text(
                          "All Types Of Cars",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => petrol()));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          color: Colors.grey,
                          child: Image.asset(
                            "images/12.jpg",
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Petrol ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                        ),
                        Text(
                          "Gasoline 80,92 and 95",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => tirerepair()));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          color: Colors.grey,
                          child: Image.asset(
                            "images/4.jpg",
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "Tire Repair",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                        ),
                        Text(
                          "Tire Repair and Air Adjustment",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => electricityRepair()));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 300,
                          color: Colors.grey,
                          child: Image.asset(
                            "images/7.jpg",
                            height: 170,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          "electricity Repair",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 2,
                        ),
                        Text(
                          "Electrical and battery Repair",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(
                          height: 6,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }

}

