import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test1/lib/model/RegisterResponse.dart';


class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool _iSsecurePassowrd=true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _numController = TextEditingController();

  String? emailError,passwordError,userNameError,numError;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(),
        body:_isLoading
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
                    "Signup",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "Enter your personal information",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                    height: 20,
                  ),
                  Text(
                    "username",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _userNameController,
                    decoration: InputDecoration(
                      errorText: userNameError,
                        hintText: ("Enter your name"),
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
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
                    "Email",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      errorText: emailError,
                        hintText: ("Enter your Email"),
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
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
                   Container(
                    height: 10,
                  ),
                  Text(
                    "phone number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numController,
                    decoration: InputDecoration(
                        hintText: ("Enter your phone"),
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _iSsecurePassowrd,
                    decoration: InputDecoration(
                      errorText: passwordError,
                        suffixIcon: togglePassword(),
                        hintText: ("Enter password"),
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
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
                    "confirm password",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Container(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: _iSsecurePassowrd,
                    decoration: InputDecoration(
                        suffixIcon: togglePassword(),
                        hintText: ("Enter confirm password"),
                        hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 199, 199, 199)),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                height: 40,
                textColor: Colors.white,
                color: Colors.orange,
                onPressed: () {
                 // Navigator.of(context).pushNamed("homebage");
                  emailError=null;
                  passwordError=null;
                  userNameError=null;
                  numError=null;
                  //  Navigator.of(context).pushNamed("homebage");
                  if(_emailController.text.isEmpty==true){

                    emailError='enter email';
                    setState(() {

                    });
                    return;
                  }
                  if(_passwordController.text.isEmpty==true){

                    passwordError='enter password';
                    setState(() {

                    });

                    return;
                  }

                  if(_userNameController.text.isEmpty==true){

                    userNameError='enter password';
                    setState(() {

                    });

                    return;
                  }
                  if(_numController.text.isEmpty==true){

                    numError='enter number';
                    setState(() {

                    });
                    return;
                  }
                  _register();
                },
                child: Text(
                  "Signup",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Container(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("login");
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(text: "Have an account? "),
                    TextSpan(
                        text: "login",
                        style: TextStyle(
                            color: Colors.orange, fontWeight: FontWeight.bold))
                  ])),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final String apiUrl = 'https://tafwila.freewebhostmost.com/api/register.php';
    final map = <String, dynamic>{};
    map['email'] = _emailController.text;
    map['password'] =  _passwordController.text;
    map['Fname'] =  _userNameController.text;
    map['number'] =  _numController;
    map['Lname'] = 'hatem';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: map,
      // headers: <String, String>{
      //   'Content-Type': 'application/json; charset=UTF-8',
      //
      // },
    );

    setState(() {
      _isLoading = false;
    });
    print('Response: ${response.body}');
    if (response.statusCode == 200) {
      try {
        final jsonResponse = jsonDecode(response.body);
        final user = RegisterResponse.fromJson(jsonResponse);
        if (user.success == true) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(user.message ?? ''),
          ));

          Navigator.of(context).pushNamed("homebage");
        }
      }

      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Register Failed'),
            content: Text('Register Failed'),
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
      else{
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Register Failed'),
            content: Text('Register Failed'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );

      }


      // Handle successful login, e.g., save user data and navigate to next screen
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));

  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _iSsecurePassowrd=!_iSsecurePassowrd;
      });
    }, icon: _iSsecurePassowrd?Icon(Icons.visibility):Icon(Icons.visibility_off)
      ,color: Colors.grey,);
  }

}

