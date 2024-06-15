import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../../model/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {


  static const String routeName="login";

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  bool _iSsecurePassowrd = true;
  var homebage;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _FnameController = TextEditingController();
  String? emailError, passwordError,FnameError;

  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Widget build(BuildContext context) {
    return Scaffold(

        drawer: Drawer(),
        body: _isLoggedIn
            ? Center(
          child: CircularProgressIndicator(),
        )
            : Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: 170,
                      height: 170,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80)),
                      child: Image.asset(
                        "images/13.jpg",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Text(
                    "login",
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "login to continue using the App",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(

                        errorText: emailError,
                        hintText: ("Enter your Email"),
                        hintStyle: TextStyle(
                            fontSize: 15, color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 199, 199, 199)),
                  ),


                  Container(
                    height: 10,
                  ),
                  Text(
                    "password",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(controller: _passwordController,
                    obscureText: _iSsecurePassowrd,
                    decoration: InputDecoration(
                        errorText: passwordError,
                        suffixIcon: togglePassword(),
                        hintText: ("Enter password"),
                        hintStyle: TextStyle(
                            fontSize: 15, color: Colors.black),
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 199, 199, 199)),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topRight,
                    child: Text(
                      "forgot pasword ?",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                textColor: Colors.white,
                color: Colors.orange,
                onPressed: () {
                  emailError = null;
                  passwordError = null;
                  if (_emailController.text.isEmpty == true) {
                    emailError = 'enter email';
                    setState(() {

                    });
                    return;
                  }
                  if (_passwordController.text.isEmpty == true) {
                    passwordError = 'enter password';
                    setState(() {

                    });

                    return;
                  }
                  _login();
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                height: 15,
              ),
              Text(
                "OR Login with",
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                textColor: Colors.white,
                color: Colors.black,
                onPressed: () {},
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Login with Google"),
                ]),
              ),
              Container(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("signup");
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(text: "Don’t Have an account? "),
                    TextSpan(
                        text: "Signup",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight
                            .bold))
                  ])),
                ),
              )
            ],
          ),
        ));
  }
  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _iSsecurePassowrd = !_iSsecurePassowrd;
        });
      },
      icon: Icon(
          _iSsecurePassowrd ? Icons.visibility : Icons.visibility_off),
      color: Colors.grey,
    );
  }
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      Navigator.of(context).pushReplacementNamed("homebage");
    }
  }

  Future<void> _login() async {
    setState(() {
      _isLoggedIn = true;
    });

    final String apiUrl = 'https://tafwila.freewebhostmost.com/api/login.php';

    final map = <String, dynamic>{};
    map['email'] = _emailController.text;
    map['password'] = _passwordController.text;
    map['Fname'] = _FnameController.text;

    final response = await http.post(
      Uri.parse(apiUrl),
      body: map,
    );

    setState(() {
      _isLoggedIn = false;
    });
    print('Response: ${response.body}');
    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        final user = Login.fromJson(jsonResponse);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Welcome ${user.fname}'),
        ));

        // حفظ البيانات في SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', _emailController.text);
        await prefs.setString('password', _passwordController.text);
        await prefs.setString('Fname', _FnameController.text);
        await prefs.setBool('isLoggedIn', true);

        Navigator.of(context).pushReplacementNamed("homebage");
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('Login Failed'),
                content: Text('Please check your username and password.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK'),
                  ),
                ],
              ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text('Login Failed'),
              content: Text('Please check your username and password.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
      );
    }
  }
}
