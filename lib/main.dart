import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/lib/package/project/Tire%20Repair%20.dart';
import 'package:test1/lib/package/project/account.dart';
import 'package:test1/lib/package/project/car%20winch.dart';
import 'package:test1/lib/package/project/chat.dart';
import 'package:test1/lib/package/project/chatbot_screen.dart';
import 'package:test1/lib/package/project/electricity%20Repair%20.dart';
import 'package:test1/lib/package/project/login.dart';
import 'package:test1/lib/package/project/map.dart';
import 'package:test1/lib/package/project/petrol.dart';
import 'package:test1/lib/package/project/shop%20.dart';
import 'package:test1/lib/package/project/signup.dart';
import 'lib/package/project/homebage.dart';
import 'package:test1/lib/package/project/map.dart';
void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme:
      ThemeData(textTheme: TextTheme(headline6: TextStyle(fontSize: 20))),
      routes: {
        "signup": (context) => signup(),
        homebage.routeName: (_) => homebage(),
        chat.routeName: (_) => chat(),
        account.routeName: (_) => account(),
        login.routeName: (_) => login(),
        carwinch.routeName: (_) => carwinch(),
        petrol.routeName: (_) => petrol(),
        tirerepair.routeName: (_) => tirerepair(),
        electricityRepair.routeName: (_) => electricityRepair(),
        shop.routeName: (_) => shop(),
        ChatScreen.routeName:(_)=>ChatScreen(),
        map.routeName: (_) => map(),
      },
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    setState(() {
      _isLoggedIn = isLoggedIn ?? false;
    });

    // انتظر 3 ثوانٍ ثم انتقل إلى صفحة اللوجن
    Future.delayed(Duration(seconds: 1), () {
      if (_isLoggedIn) {
        Navigator.of(context).pushReplacementNamed(homebage.routeName);
      } else {
        Navigator.of(context).pushReplacementNamed(login.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // تعيين لون الخلفية
      body: Center(
        child: Image.asset('images/13.jpg'), // عرض الصورة
      ),
    );
  }
}